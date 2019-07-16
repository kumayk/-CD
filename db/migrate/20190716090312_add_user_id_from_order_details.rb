class AddUserIdFromOrderDetails < ActiveRecord::Migration[5.2]
  def change
  	add_column :order_details, :user_id, :integer
  end
end
