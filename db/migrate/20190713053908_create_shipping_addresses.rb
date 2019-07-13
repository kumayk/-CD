class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.string :shipping_name
      t.string :address
      t.string :zip_code
      t.string :phone_number

      t.timestamps
    end
  end
end
