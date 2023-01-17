class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    return unless @item.purchase_record.present? && @item.user.id == current_user.id

    redirect_to root_path
  end

  def edit
    return if @item.user.id == current_user.id

    redirect_to action: :index
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if @item.user.id == current_user.id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explain, :price, :category_id, :state_id, :delivery_charge_id, :prefecture_id,
                                 :delivery_time_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
