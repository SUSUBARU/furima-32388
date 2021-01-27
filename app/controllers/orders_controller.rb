class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @order = UserItem.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = UserItem.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:user_item, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :user_id, :item_id).merge(user_id: current_user.id, token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
