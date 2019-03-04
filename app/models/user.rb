class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :email, :password, :post_code, :date_of_birth, presence: true, on: :create
  validates :post_code, numericality: { only_integer: true }, length: { is: 4 }
  # has_many :interests, as: :categorable

  has_one :business
  has_many :product_reviews
  has_many :transactions

  def name
   self.first_name + " " + self.last_name

  end

  after_create_commit :add_customer_id

  def add_customer_id
    if self.customer_id.nil?
          
        customer = Stripe::Customer.create(
          :email => self.email
        )

        self.customer_id = customer.id
        self.save
    end
  end

end
