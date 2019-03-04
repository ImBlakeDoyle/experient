class AddTransactionToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_reviews, :transaction, foreign_key: true
  end
end
