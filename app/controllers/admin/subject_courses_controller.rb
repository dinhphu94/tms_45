class Admin::SubjectCoursesController < ApplicationController
  before_action :load_subject_course
  skip_before_action :verify_admin
  before_action do
    verify_admin_or_supervisor @subject_course.course
  end

  def update
    @subject_course.update_attributes status: params[:type].to_i
    redirect_to :back
  end

  private
  def load_subject_course
    @subject_course = SubjectCourse.find_by id: params[:id]
  end
end
