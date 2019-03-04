class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :trading_name
      t.string :registered_business_name
      t.string :business_address
      t.integer :post_code
      t.integer :abn
      t.integer :phone_number

      t.timestamps
    end
  end
end
