class Admin::UserCoursesController < Admin::AdminController
  before_action :load_user_course, only: :show
  before_action :load_course, only: :index

  def index
  end

  def show
  end

  private
  def load_user_course
    @user_course = UserCourse.find params[:id]
  end

  def load_course
    @course = Course.find params[:course_id]
  end
end
