class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item=Item.new
  end

  def create
   Item.create(item_params)
  end

  def edit
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:item_name,:item_detail,:item_category_id,:item_condition_id,:delivery_charge_id,:shipping_area_id,:days_to_ship_id,:price)
  end
end
