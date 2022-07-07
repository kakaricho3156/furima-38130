class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:show,:index]
before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end
  
  def new
    @item=Item.new
  end

  def create
   Item.create(item_params)
   if @item.save
    redirect_to root_path
  else
    render :new
  end
  end

  def edit
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:item_name,:item_detail,:item_category_id,:item_condition_id,:delivery_charge_id,:shipping_area_id,:days_to_ship_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
