class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :load_course, only: [:show]

  def show
  end

  private
  def load_course
    @course = Course.find params[:id]
  end
end
