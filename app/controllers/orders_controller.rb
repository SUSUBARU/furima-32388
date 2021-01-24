class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @order = UserItem.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = UserItem.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:user_item, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :user_id, :item_id).merge(user_id: current_user.id)
  end

end
