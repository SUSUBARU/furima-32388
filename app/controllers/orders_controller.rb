class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @user_items = UserItem.includes(:user)
  end

  def create
    #binding.pry(ターミナルにはparams入力すること)
    @user_item = UserItem.new(user_item_params)
    if @user_item.user_id == current_user.id
      redirect_to action: :index
    end
    if @user_item.valid?
      @user_item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def user_item_params
    params.require(:user_item).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number).merge(token: params[:token])
  end

end
