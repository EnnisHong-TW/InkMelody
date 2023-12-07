class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  # delegate :title, to: :product
end
