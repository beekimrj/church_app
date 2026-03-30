class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  add_flash_types :success, :warning, :error

  helper_method :allowed_query_params

  def allowed_query_params
    {
      q: params[:q],
      status: params[:status],
      page: params[:page]
    }
  end
end
