class AddDiskIdToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :disk_id, :string
  end
end
