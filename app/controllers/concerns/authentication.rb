module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :require_authentication
    helper_method :authenticated?
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :require_authentication, **options
    end
  end

  private

  def authenticated?
    resume_user_session
  end

  def require_authentication
    resume_user_session || request_authentication
  end

  def resume_user_session
    Current.user_session ||= find_user_session_by_cookie

    refresh_session_expiry if Current.user_session.present?
  end

  def refresh_session_expiry
    set_cookie(Current.user_session)
  end

  def find_user_session_by_cookie
    token = cookies.encrypted[:user_token]

    return unless token

    UserSession.active.find_by(token: token)
  end

  def request_authentication
    session[:return_to_after_authenticating] = request.url
    redirect_to new_user_session_path
  end

  def after_authentication_url
    session.delete(:return_to_after_authenticating) || root_url
  end

  def start_new_user_session_for(user)
    user.user_sessions.create!(
      user_agent: request.user_agent,
      ip_address: request.remote_ip,
    ).tap do |user_session|
      Current.user_session = user_session
      set_cookie(user_session)
    end
  end

  def terminate_user_session
    Current.user_session&.update!(expires_at: Time.current)

    cookies.delete(:user_token)
  end

  def set_cookie(user_session)
    cookies.encrypted[:user_token] = {
      value: user_session.token,
      expires: session_expiry_time,
      httponly: true,
      same_site: :lax
    }
  end

  def session_expiry_time
    ENV.fetch("SESSION_VALID_PERIOD", 30).to_i.minutes.from_now
  end
end
