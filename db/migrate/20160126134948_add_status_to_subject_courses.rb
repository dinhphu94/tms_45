class AddStatusToSubjectCourses < ActiveRecord::Migration
  def change
    add_column :subject_courses, :status, :interger, default: 0
  end
end
