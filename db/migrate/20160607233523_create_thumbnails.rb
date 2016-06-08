class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.string :url
      t.string :image_url
      t.string :description
      t.string :title
      t.string :favicon
      t.timestamps null: false
    end
  end
end
