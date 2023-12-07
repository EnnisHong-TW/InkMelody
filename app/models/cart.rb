class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  # 委任、指定delegate 轉發方法 所以委任對象一定要有該方法才行
  delegate :count, to: :cart_items

  def total_amout
    cart_items.reduce(0) do |acc, item|
      acc + (item.product.price * item.quantity)
    end.to_i
  end

  def add!(t)
    found_item = cart_items.find { |item| item.product == t.product }

    if found_item
      # found_item.update(quantity: found_item.quantity + item.quantity)
      found_item.increment!(:quantity, t.quantity)
    else
      cart_items << t
    end
  end

end
