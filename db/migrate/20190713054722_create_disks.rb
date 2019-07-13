class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks do |t|
      t.string :disk_name

      t.timestamps
    end
  end
end
