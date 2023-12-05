class Api::V1::ProductsController < ApplicationController
  before_action :find_product, only: [:like]
  before_action :authenticate_user!

  def like
    #加入喜歡
    if current_user.liked?(@product)
      current_user.liked_products.destroy(@product)
      render json: { status: 'unliked'  }
      #移除喜歡
    else
      current_user.liked_products << @product
      render json: { status: 'liked'  }
      #加入喜歡
    end
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end
end
