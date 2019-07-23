class AddItemrIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :item_id, :string
  end
end
