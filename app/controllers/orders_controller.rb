class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :user_order
  before_action :user_ordered

  def index # @tweet.comments.each do |comment| # @item.order(商品に紐づく購入の情報)
    @order = OrderAddress.new
  end

  def create
    # params, item?
    @order = OrderAddress.new(order_params) # (post_number: params[:order_address][:post_number], ..... , item_id: params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_number, :place_id, :city, :street, :building, :tell_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    item_price = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item_price[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def user_order
    redirect_to root_path if current_user.id == @item.user_id
  end

  def user_ordered
    redirect_to root_path if @item.order.present?
  end
end
