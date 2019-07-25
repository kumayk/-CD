class ChangeShippingFeeToOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :orders, :shipping_fee, 500
  end
end
