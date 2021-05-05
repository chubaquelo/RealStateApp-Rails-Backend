class User < ApplicationRecord
  has_secure_password
  has_many :bookings, dependent: :destroy
  has_many :scheduled_properties, through: :bookings, source: 'property'
end
