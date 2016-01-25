class AddFinishToUserTasks < ActiveRecord::Migration
  def change
    add_column :user_tasks, :finish, :boolean, default: false
  end
end
