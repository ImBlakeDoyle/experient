class Business < ApplicationRecord
 belongs_to :user
 validates :trading_name, :registered_business_name, :business_address, :post_code, :abn, :phone_number, presence: true
 validates :post_code, numericality: { only_integer: true }, length: { is: 4 }
 validates :abn, numericality: { only_integer: true }
 validates :phone_number, numericality: { only_integer: true }
end
