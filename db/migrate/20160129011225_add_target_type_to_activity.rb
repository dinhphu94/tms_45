class AddTargetTypeToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :target_type, :interger
  end
end
