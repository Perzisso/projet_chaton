class User < ApplicationRecord
  has_many :carts
  has_many :items, through: :cart
  has_many :orders
  has_many :items, through: :order
  has_one  :avatar

  after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def welcome_send
   UserMailer.welcome_email(self).deliver_now
  end
  
end