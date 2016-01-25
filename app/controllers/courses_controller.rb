class CoursesController < ApplicationController
  before_action :logged_in_user, only: :show
  before_action :load_course, only: :show

  def index
    @courses = Course.paginate page: params[:page]
  end

  def show
  end

  private
  def load_course
    @course = Course.find params[:id]
  end
end
