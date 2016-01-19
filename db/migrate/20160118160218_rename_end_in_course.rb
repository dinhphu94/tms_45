class RenameEndInCourse < ActiveRecord::Migration
  def change
    rename_column :courses, :end, :end_date
  end
end
