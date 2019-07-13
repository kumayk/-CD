class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :truck_number
      t.string :song_name

      t.timestamps
    end
  end
end
