class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [ :index]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  root_path
     else
      render :new
     end
  end

  private
  def item_params
    params.require(:item).permit(:product, :image, :description, :category_id, :product_condition_id, :shipping_charges_id, :prefecture_id, :number_of_days_id, :price).merge(user_id: current_user.id)
  end


  
end
