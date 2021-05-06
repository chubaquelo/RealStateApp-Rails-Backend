class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates_uniqueness_of :property, scope: :user
  validates_presence_of :user_id, :property_id
end
