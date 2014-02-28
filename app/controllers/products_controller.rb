class ProductsController < ApplicationController
  before_action :admin_only, except: :show

  def new
    @product = Product.new
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

  end

  def update

  end

  def destroy

  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :product_image_attributes => [:id, :image])
  end

end
