class Property < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :likers, through: :favourites, source: "user"
end
