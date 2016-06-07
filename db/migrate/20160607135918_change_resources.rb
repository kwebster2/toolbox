class ChangeResources < ActiveRecord::Migration
  def change
    remove_column :resources, :subject_id
    add_column :resources, :category_id, :integer
  end
end
