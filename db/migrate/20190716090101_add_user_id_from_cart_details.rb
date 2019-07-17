class AddUserIdFromCartDetails < ActiveRecord::Migration[5.2]
  def change
  	add_column :cart_details, :user_id, :integer
  end
end
