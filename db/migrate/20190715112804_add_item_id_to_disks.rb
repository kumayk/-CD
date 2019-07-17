class AddItemIdToDisks < ActiveRecord::Migration[5.2]
  def change
    add_column :disks, :item_id, :string
  end
end
