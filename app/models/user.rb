class User < ApplicationRecord
  has_secure_password
  has_many :favourites, dependent: :destroy
  has_many :liked_properties, through: :favourites, source: 'property'

  validates :email, uniqueness: true
end
