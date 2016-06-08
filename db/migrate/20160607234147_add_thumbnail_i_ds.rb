class AddThumbnailIDs < ActiveRecord::Migration
  def change
    add_column :resources, :thumbnail_id, :integer
    add_column :thumbnails, :resource_id, :integer
  end
end
