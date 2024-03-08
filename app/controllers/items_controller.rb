class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: [:edit, :show]
  before_action :move_to_signIn, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if @item.order.present?
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_signIn
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def items_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end