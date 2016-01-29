class Admin::AdminController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin

  private
  def verify_admin
    unless current_user.admin?
      flash[:warning] = t :permission_denied
      redirect_to root_url
    end
  end

  def verify_admin_or_supervisor course
    unless current_user.admin? || current_user.supervisor?(course)
      flash[:warning] = t :permission_denied
      redirect_to root_url
    end
  end
end
