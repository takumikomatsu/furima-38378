class PurchasersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :index
  def index
    @item = Item.find(params[:item_id])
    @purchaser = Purchaser.new
    @purchaser_address = PurchaserAddress.new
  end

  def create
    @purchaser_address = PurchaserAddress.new(purchaser_params)
    if @purchaser_address.valid?
      pay_item
      @purchaser_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_address).permit(:postal_code, :region_id, :city, :address, :building,
                                              :phone_number, :token).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.purchaser.present?
  end

  def pay_item
    Payjp.api_key = 'sk_test_995406192374a9d973cda590'
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: purchaser_params[:token],
      currency: 'jpy'
    )
  end
end
