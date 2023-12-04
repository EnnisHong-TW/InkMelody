class Api::V1::ProductsController < ApplicationController
  before_action :find_product, only: [:like]
  before_action :authenticate_user!

  def like
    render json: { status: 'liked' }
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end
end
