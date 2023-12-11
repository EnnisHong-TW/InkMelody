class CartsController < ApplicationController
  include Braintreeable
  # before_action :authenticate_user!
  before_action :find_product, only:[:create]

  def show
  end

  def create
    # 加入購物車
    item = CartItem.new(product: @product, quantity: params[:quantity])
    current_cart.add!(item)
    # current_user.cart.cart_items
    # 轉商品頁
    redirect_to @product, notice: "成功加入購物車"
  end

  def destroy
    current_cart.destroy
    redirect_to root_path, notice: '購物車已清空'
  end

  def checkout
    @order = Order.new
    @token = braintree_gateway.client_token.generate

  end

  private
  def find_product
    @product = Product.find(params[:id])
  end

  # def gateway
  #   Braintree::Gateway.new(
  #     :environment => :sandbox,
  #     :merchant_id => "mshfmqycgyxh3wdw",
  #     :public_key => "rh9st67ck9bwyktk",
  #     :private_key => "140c87c7702e1ae5c79b54e6bd6756a2",
  #   )
  # end
end
