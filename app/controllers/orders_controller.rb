class OrdersController < ApplicationController
  include Braintreeable
  before_action :authenticate_user!

  def create
    # 建立訂單
    order = current_user.orders.new(order_params)

    order.order_items = current_cart.cart_items.map do |item|
      product = item.product
      quantity = item.quantity
      price = product.price
      # state = 'pending'

      OrderItem.new(product:, quantity:, price:)
    end

    if order.save
      # 請款、刷卡
      result = braintree_gateway.transaction.sale(
        amount: current_cart.total_amout,
        payment_method_nonce: params[:nonce]
      )

      # 清購物車
      current_cart.destroy

      redirect_to root_path, notice: '付款成功'
    else
      redirect_to checkout_cart_path, alert: '系統忙碌中，請稍候再試'
    end
  end

  private

  def order_params
    params.require(:order).permit(:recipient, :address, :tel)
  end
end
