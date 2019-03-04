class RemoveQuantityFromTransaction < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :quantity
  end
end
