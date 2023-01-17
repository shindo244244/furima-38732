class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @purchaser_address = PurchaserAddress.new
    @item = Item.find(params[:item_id])

    redirect_to root_path if @item.user.id == current_user.id || @item.purchase_record.present?
  end

  def create
    @item = Item.find(params[:item_id])
    @purchaser_address = PurchaserAddress.new(purchaser_record_params)

    if @purchaser_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: purchaser_record_params[:token],
        currency: 'jpy'
      )
      @purchaser_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_record_params
    params.require(:purchaser_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
end
