class RemoveStatusToSubjectCourses < ActiveRecord::Migration
  def change
    remove_column :subject_courses, :status, :string
  end
end
