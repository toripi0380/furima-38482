class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :product, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :product_condition_id, presence: true
  validates :shipping_charges_id, presence: true
  validates :prefecture_id, presence: true
  validates :number_of_days_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                  format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true
end

