class Exhibit < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charges


  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_charges_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :number_of_days_id, numericality: { other_than: 1 , message: "can't be blank"}
end
