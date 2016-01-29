class AddStatusToUserCourses < ActiveRecord::Migration
  def change
    add_column :user_courses, :status, :integer, default: 0
  end
end
