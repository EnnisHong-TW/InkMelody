class Api::V1::ProductsController < ApplicationController
  before_action :find_product, only: [:like]
  before_action :find_user_product, only: [:sort]
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

  def sort
    @product.insert_at(params[:newIndex] + 1)
    render json: {'result':123}
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end

  def find_user_product
    @product = current_user.products.unscope(where: :onsale).find(params[:id])
  end
end
