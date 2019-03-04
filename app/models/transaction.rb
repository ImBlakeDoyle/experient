class Transaction < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :product_review
end
