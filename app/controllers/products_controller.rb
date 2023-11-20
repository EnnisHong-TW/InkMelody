class ProductsController < ApplicationController
  def new
  end

  def create
    # render html: params
    # 寫入資料庫
    # 顯示"新增成功"
    # 跳轉其他頁面
    product = Product.new(product_params)

    product.save

    redirect_to root_path
  end 

  # Strong Parameter
  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
