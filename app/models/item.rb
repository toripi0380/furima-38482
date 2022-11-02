class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charges
  belongs_to :prefecture
  belongs_to :number_of_days

  validates :product, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :product_condition_id, presence: true
  validates :shipping_charges_id, presence: true
  validates :prefecture_id, presence: true
  validates :number_of_days_id, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :product_condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_charges_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :number_of_days_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                  format: { with: /\A[0-9]+\z/ }
end

