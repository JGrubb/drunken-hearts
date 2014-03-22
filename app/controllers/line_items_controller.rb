class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    if @line_item.save
      render template: 'carts/show.json.jbuilder'
    else
      render :action => "new"
    end
  end
end
