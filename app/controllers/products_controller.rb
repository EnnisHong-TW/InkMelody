class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    # render html: params
    # 寫入資料庫
    # 顯示"新增成功"
    # 跳轉其他頁面
    @product = Product.new(product_params)

    if @product.save
      # flush[:notice] = '新增商品成功'
      redirect_to root_path, notice: '新增商品成功'
    else
      render :new, alert: '新增商品失敗'
    end
  end 

  def index 
    @products = Product.all.order(id: :desc)
  end

  def show
    # @product = Product.find_by!(id: params[:id])
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end 

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product), notice: '更新成功'
    else
      render :edit
    end
  end

  # Strong Parameter
  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
