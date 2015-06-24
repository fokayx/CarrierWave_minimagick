class ProductsController < ApplicationController


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      if params[:images]
        params[:images].each { |image| @product.photos.create(image: image)}
      end
      redirect_to products_path, notice:'新增產品成功'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
  #  render text:params
  #  return
    @product = Product.find(params[:id])
    if @product.update(product_params)
      if params[:images]
        params[:images].each { |image| @product.photos.create(image: image) }
      end

      redirect_to products_path, notice: '產品編輯完成'
    else
      render :edit, notice: 'error'
    end

  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to products_path, notice:'產品已刪除'
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :is_online, :productimage, :remove_productimage)
  end
end
