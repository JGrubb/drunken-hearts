class TransactionsController < ApplicationController
  def new
  end

  def create
    @product = Product.find_by!(
      permalink: params[:permalink]
    )
    sale = @product.sales.create(
      amount:       @product.price,
      email:        params[:email],
      stripe_token: params[:stripeToken]
    )
    sale.process!
    if sale.finished?
      redirect_to pickup_url(guid: sale.guid)
    else
      flash.now[:alert] = sale.error
      render :new
    end
  end
end
