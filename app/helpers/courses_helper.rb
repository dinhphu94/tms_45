module CoursesHelper
  def user_subject subject
    @user_subject = current_user.user_subjects.find_by subject_id: subject.id
  end

  def user_course course_id
    @user_course = current_user.user_courses.find_by course_id: course_id
  end
end
