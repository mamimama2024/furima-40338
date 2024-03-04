class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(items_params)
    redirect_to root_path
  end

  private

  def items_params
    params.require(:items).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image ).merge(user_id: current_user.id)
  end

end
