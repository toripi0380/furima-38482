class PurchasersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_furima, only: [:index, :create]
  before_action :others_item, only: [:index]
  def index
    @purchaser_information = PurchaserInformation.new
  end

  
  def create
    @purchaser_information = PurchaserInformation.new(purchaser_params)
    if @purchaser_information.valid?
       pay_item
      @purchaser_information.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def purchaser_params
    params.require(:purchaser_information).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id:current_user.id, item_id:@item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],  # 商品の値段
        card: purchaser_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_furima
    @item = Item.find(params[:item_id])
  end

  def others_item
    if @item.user_id == current_user.id || @item.purchaser != nil
      redirect_to root_path
    end
  end
end
