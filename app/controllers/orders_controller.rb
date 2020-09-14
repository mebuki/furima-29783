class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params[:item_id])
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
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = "sk_test_38302a33701caad1eed24042"
    Payjp::Charge.create(
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
