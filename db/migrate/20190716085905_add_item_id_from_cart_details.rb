class AddItemIdFromCartDetails < ActiveRecord::Migration[5.2]
  def change
  	add_column :cart_details, :item_id, :integer
  end
end
