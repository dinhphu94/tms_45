class RemoveActiveFromUserCourses < ActiveRecord::Migration
  def change
    remove_column :user_courses, :active, :boolean
  end
end
