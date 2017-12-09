class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.admin?
      chinese_posts_path
    else
      root_path
    end
  end

  rescue_from Pundit::NotAuthorizedError,
    with: :user_not_authorized
  private
  def user_not_authorized
    flash[:error] = "XXX"
    redirect_to(request.referrer || root_path)
  end
end
