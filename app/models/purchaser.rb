class Purchaser < ApplicationRecord
  belongs_to :user
  has_one :information
  belongs_to :item
end
