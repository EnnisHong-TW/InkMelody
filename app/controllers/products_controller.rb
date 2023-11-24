class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  # before_action :find_product, except: [:new, :create, :index]

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
    @products = Product.order(id: :desc)
  end

  def show
    # @product = Product.find_by!(id: params[:id])
    # @product = Product.find(params[:id])
  end

  def edit
    #@product = Product.find(params[:id])
  end 

  def update
    #@product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product), notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    #@product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path, notice: '商品刪除成功'
  end

  private
  # Strong Parameter
  def product_params
    params.require(:product).permit(:title, :description, :price, :onsale)
  end

  def find_product
    # begin
    @product = Product.find(params[:id])
    # rescue ActiveRecord::RecordNotFound
      # render html: '查無此資料', status: 404
      # render file: Rails.public_path.join('404.html'), 
            # status: 404, 
            # status: :not_found,
            # layout: false
    # end
  end

 
end
