class Admin::SubjectCoursesController < ApplicationController
  def update
    @subject_course = SubjectCourse.find_by id: params[:id]
    @subject_course.update_attributes status: params[:type].to_i
    redirect_to :back
  end
end
