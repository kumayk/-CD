class AddDiskIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :disk_id, :string
  end
end
