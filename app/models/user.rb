class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable ,:trackable
   has_many :carts, dependent: :destroy
   has_many :books , through: :carts
   has_many :orders 
   
   after_create :send_welcome_email

   def send_welcome_email
    SignupMailer.welcome(self).deliver_now
  end
  
end
