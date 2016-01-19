class RenameStartInCourse < ActiveRecord::Migration
  def change
    rename_column :courses, :start, :start_date
  end
end
