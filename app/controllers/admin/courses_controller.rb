class Admin::CoursesController < Admin::AdminController
  before_action :load_course, only: [:show]

  def new
    @course = Course.new
    @course.build_subject_courses
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:notice] = t "admin.flash.create_course"
      redirect_to admin_course_path @course
    else
      @course.build_subject_courses
      render :new
    end
  end

  def show
  end

  private
  def course_params
    params.require(:course).permit :name, :description, :status, :start_date,
      :end_date, subject_courses_attributes: [:id, :subject_id, :course_id],
      subjects_attributes: [:id, :name, :description,
      tasks_attributes: [:id, :name]], user_courses_attributes: [:id, :course_id, :user_id, :status, :_destroy]
  end

  def load_course
    @course = Course.find_by id: params[:id]
  end
end
