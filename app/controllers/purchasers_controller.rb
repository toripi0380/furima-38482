class PurchasersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @purchaser_information = PurchaserInformation.new
  end


  def new
  end
  
  def create
    @item = Item.find(params[:item_id])
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
end
