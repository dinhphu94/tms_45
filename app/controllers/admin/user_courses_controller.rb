class Admin::UserCoursesController < Admin::AdminController
  before_action :load_user_course, only: :show
  before_action :load_course, only: :index

  def index
    @users = User.trainee.paginate page: params[:page]
    @users.each do |user|
      unless @course.user_courses.find_by user_id: user.id
        @course.user_courses.build user_id: user.id
      end
    end
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
