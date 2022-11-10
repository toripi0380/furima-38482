class PurchaserInformation
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '3桁ハイフン4桁」の半角文字列のみ入力してください' }
    validates :prefecture_id,numericality: { other_than: 1 , message: "を選択してください"} 
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '10桁以上11桁以内の半角数値のみで入力してください' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchaser = Purchaser.create(user_id: user_id, item_id: item_id)
    Information.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchaser_id: purchaser.id)
  end
end