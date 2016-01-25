class SetDefaultSupervisorToUserCourse < ActiveRecord::Migration
  def change
    change_column :user_courses, :supervisor, :boolean, default: false
  end
end
