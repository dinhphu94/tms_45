class RemoveTargetNameToActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :target_name, :string
  end
end
