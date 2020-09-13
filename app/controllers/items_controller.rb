class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end


  def new
    @item = Item.new
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :fee_id, :place_id, :day_id, :price, :image, :user_id).merge(user_id: current_user.id)
  end
  
end

