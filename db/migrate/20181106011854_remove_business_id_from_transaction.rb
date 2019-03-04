class RemoveBusinessIdFromTransaction < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :business_id, :integer
  end
end
