class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product

  def create
    # 加入購物車
    item = CartItem.new(product: @product, quantity: params[:quantity])
    current_cart.add!(item)
    # current_user.cart.cart_items
    # 轉商品頁
    redirect_to @product, notice: "成功加入購物車"
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
