class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable ,:trackable, :lockable, maximum_attempts: 5
   has_many :carts
   has_many :books , through: :carts
   has_many :orders

 end
