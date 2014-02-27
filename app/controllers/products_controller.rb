class ProductsController < ApplicationController
  before_action :admin_only, except: :show

  def new
    @product = Product.new
  end

  def create

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
