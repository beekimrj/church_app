class UserSessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_user_session_url, alert: "Try again later." }

  def new
  end

  def create
    if user = User.authenticate_by(params.permit(:username, :password))
      start_new_user_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_user_session_path, alert: "Please check username and password"
    end
  end

  def destroy
    terminate_user_session
    redirect_to new_user_session_path
  end
end
