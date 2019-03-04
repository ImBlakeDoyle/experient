class Product < ApplicationRecord
  belongs_to :user

  belongs_to :age_group
  belongs_to :category
  has_many :transactions
  mount_uploader :image, ImageUploader
  validates :name, :cost, :location, :description, :image, presence: true, on: :create
  def self.search(search)
    if search && search!=""
        where(["name ILIKE ?","%#{search}%"]).or where(["category ILIKE ?","%#{search}%"]).or where(["location ILIKE ?","%#{search}%"]).or where(["description ILIKE ?","%#{search}%"])
        
    else
        all
    end

    
end
end
