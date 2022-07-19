class BuyingItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]
  def index
    @buying_item_form=BuyingItemForm.new
  end
  def create
    @buying_item_form=BuyingItemForm.new(buying_item_params)
    # binding.pry
    if @buying_item_form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: buying_item_params[:token],   
        currency: 'jpy'               
      )
      
      

      @buying_item_form.save
      redirect_to root_path
    else
      render :index
  end
end

private

def buying_item_params
  params.require(:buying_item_form).permit(:post_number,:town,:prefecture,:address,:building,:telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end

def non_purchased_item
  @item = Item.find(params[:item_id])
  redirect_to root_path if current_user.id == @item.user_id || @item.buying_item.present?
end

end