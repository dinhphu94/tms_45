class Admin::UsersController < ApplicationController
  before_action :load_user, except: [:index, :create, :new]
  before_action :verify_admin
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "flash.success"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :role
  end

  def load_user
    @user = User.find params[:id]
  end
end
