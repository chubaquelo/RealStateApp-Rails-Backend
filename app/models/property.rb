class Property < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :likers, through: :favourites, source: 'user'

  validates_uniqueness_of :title, :address
  validates_presence_of :title, :desc, :price, :bedrooms, :baths, :sqrmeters, :address, :img_url
  validates :category, inclusion: { in: %w(houses appartments),
    message: "%{value} is not a valid category" }
end
