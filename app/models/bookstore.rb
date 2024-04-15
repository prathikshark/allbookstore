class Bookstore < ApplicationRecord
    has_many :books, dependent: :destroy
    has_one_attached  :image

    validates :name, presence: true
end
