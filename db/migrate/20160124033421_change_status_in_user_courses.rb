class ChangeStatusInUserCourses < ActiveRecord::Migration
  def change
    remove_column :user_courses, :status, :integer
    add_column :user_courses, :active, :boolean
  end
end
