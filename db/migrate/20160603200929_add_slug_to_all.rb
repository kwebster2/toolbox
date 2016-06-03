class AddSlugToAll < ActiveRecord::Migration
  def change
    add_column :categories, :slug, :string
    add_column :subjects, :slug, :string
    add_column :cohorts, :slug, :string
  end
end
