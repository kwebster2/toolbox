class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :description
      t.string :url
      t.integer :user_id
      t.integer :subject_id
      t.timestamps null: false
    end
  end
end
