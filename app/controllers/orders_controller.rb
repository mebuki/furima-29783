class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  # parameter
  # { order_address => { post_numer => "", ....... } }

  def order_params
    params.permit(:item_id, :post_number, :place_id, :city, :street, :building, :tell_number, :token).merge(user_id: current_user.id)
  end

  def pay_item
    item_price = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item_price[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
