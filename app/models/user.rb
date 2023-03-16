class User < ApplicationRecord
  has_many :carts
  has_many :items, through: :cart
  has_many :orders
  has_many :items, through: :order
  has_one_attached :avatar

  validates :first_name, :last_name, :street, :email, :password, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }
  validates :street, length: { minimum: 10 }
  validates :email, uniqueness: true

  after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def welcome_send
   UserMailer.welcome_email(self).deliver_now
  end
  
end