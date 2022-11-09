class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to  item_path
     else
      render :edit
     end
  end

  def show

  end

  def destroy
    if @item.destroy && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:product, :image, :description, :category_id, :condition_id, :shipping_charges_id, :prefecture_id, :number_of_days_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
   end

   
   def prevent_url
    if @item.user_id != current_user.id || @item.purchaser != nil
      redirect_to root_path
    end


  end
  
end
