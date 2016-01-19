class RemoveStatusFromUserCourses < ActiveRecord::Migration
  def change
    remove_column :user_courses, :status, :string
  end
end
