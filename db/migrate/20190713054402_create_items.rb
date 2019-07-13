class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :disk_name
      t.string :disk_image
      t.integer :stock
      t.integer :price
      t.integer :item_status

      t.timestamps
    end
  end
end
