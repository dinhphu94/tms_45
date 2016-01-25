class AddStatusToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :status, :interger, default: 0
  end
end
