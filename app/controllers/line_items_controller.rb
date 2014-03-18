class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build(:product => product)
    if @line_item.save
      flash[:notice] = "Added #{product.title} to cart!"
    else
      #render :action => "new"
    end
  end
end
