class ProductsController < ApplicationController
  load_and_authorize_resource

  def index
    @products = Product.all.order("name")
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @product.save
      redirect_to @product, notice: "Product successfully created!"
    else
      render :new
    end
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to @product, notice: "Product successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :color_id)
  end
end