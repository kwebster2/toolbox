class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :user_name
      t.string  :email
      t.string  :provider
      t.string  :uid
      t.integer :cohort_id
      t.timestamps null: false
    end
  end
end
