class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :order_status
      t.string :shipping_address
      t.string :payment
      t.integer :sub_total_price
      t.integer :shipping_fee
      t.integer :total_price
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
