class Api::V1::ProductsController < ApplicationController
  def like
    render json: { status: 'liked' }
  end
end
