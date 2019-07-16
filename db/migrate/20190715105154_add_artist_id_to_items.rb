class AddArtistIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :artist_id, :string
    add_column :items, :label_id, :string
    add_column :items, :category_id, :string
  end
end
