class RenameStartEndInUserSubjects < ActiveRecord::Migration
  def change
    rename_column :user_subjects, :start, :start_date
    rename_column :user_subjects, :end, :end_date
  end
end
