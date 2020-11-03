class OrdersController < ApplicationController 
  
  before_action :set_item, only: [:index, :create]

  def index
    @order_shipping_address = OrderShippingAddress.new
  end
  
  def create
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  private
  
  def order_shipping_address_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_shipping_address_params[:token],
      currency: 'jpy'
    )
  end

end
