class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in?
      flash[:danger] = t :need_login
      redirect_to login_url
    end
  end

  def verify_admin
    unless current_user.admin?
      flash[:alert] = t "permission_denied"
      redirect_to root_url
    end
  end
end
