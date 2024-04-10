class Book < ApplicationRecord
  belongs_to :bookstore
  has_many :carts ,dependent: :destroy
  has_many :users ,through: :carts
  has_one_attached :image
end
