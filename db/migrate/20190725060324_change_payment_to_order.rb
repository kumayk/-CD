class ChangePaymentToOrder < ActiveRecord::Migration[5.2]
  def change
  	  change_column :orders, :payment, :integer
  end
end
