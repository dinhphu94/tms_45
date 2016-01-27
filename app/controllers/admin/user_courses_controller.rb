class Admin::UserCoursesController < Admin::AdminController
  before_action :load_user_course, only: :show
  before_action :load_course, only: :index
  skip_before_action :verify_admin
  before_action do
    verify_admin_or_supervisor @course
  end

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
