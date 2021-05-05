class Property < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :visitors, through: :bookings, source: "user"
end
