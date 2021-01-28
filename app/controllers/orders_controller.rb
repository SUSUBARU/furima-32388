class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!
  def index
    @order = UserItem.new
    if current_user.id == @item.user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
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
    params.permit(:user_item, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
  def set_order
    @item = Item.find(params[:item_id])
  end
end
