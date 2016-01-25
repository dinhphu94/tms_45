class RemoveStatusToCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :status, :string
  end
end
