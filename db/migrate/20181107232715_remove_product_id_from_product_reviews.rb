class RemoveProductIdFromProductReviews < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :product_reviews, :products
    remove_column :product_reviews, :product_id
  end
end
