class AddStatusToUserCourses < ActiveRecord::Migration
  def change
    add_column :user_courses, :status, :integer
  end
end
