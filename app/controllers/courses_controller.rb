class CoursesController < ApplicationController
  before_action :logged_in_user, only: :show
  before_action :load_course, only: :show

  def index
    search_course = Course.search(params[:search]).order :id
    @courses = search_course.paginate page: params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  end

  private
  def load_course
    @course = Course.find params[:id]
  end
end
