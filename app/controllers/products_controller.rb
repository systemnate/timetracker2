class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order("name")
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
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
  end

  private

  def product_params
    params.require(:product).permit(:name, :color_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end