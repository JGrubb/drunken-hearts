class ProductsController < ApplicationController
  before_action :admin_only, except: :show

  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Good job, that #{@product.title} is gonna sell like hotcakes."
      redirect_to product_path(@product)
    else
      flash[:error] = "Problema"
      render action: :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @title = @product.title
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render action: 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.delete
      flash[:notice] = "That product is gone now."
      redirect_to store_path
    else
      flash[:error] = "That didn't work for some reason"
      redirect_to product
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :product_images_attributes => [:id, :image, :_destroy])
  end
end
