class AddCategoryToCohorts < ActiveRecord::Migration
  def change
    add_column :categories, :cohort_id, :integer
  end
end
