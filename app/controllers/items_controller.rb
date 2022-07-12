class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update,:destroy]
  before_action :redirect_item, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end
  
  def new
    @item=Item.new
  end

  def create
   @item=Item.new(item_params)
   if @item.save
    redirect_to root_path
  else
    render :new
  end
  end

def show
  

end

def edit
 

end

def update
  @item.update(item_params)
  if @item.valid?
    redirect_to item_path(item_params)
  else
    render 'edit'
  end
end

def destroy

@item.destroy
redirect_to root_path
end

  private
  def item_params
    params.require(:item).permit(:item_name,:item_detail,:category_id,:condition_id,:delivery_charge_id,:prefecture_id,:days_to_ship_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  def redirect_item
    if current_user.id != @item.user_id

  
      redirect_to root_path
     
     end
    end
end
