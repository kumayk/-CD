class RemoveDiskImageFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :disk_image, :string
  end
end
