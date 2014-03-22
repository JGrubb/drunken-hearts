class CartsController < ApplicationController
  def show
    @cart = current_cart
    @title = "Your cart"
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to(store_url, :notice => "Your cart is empty") }
      format.json { render :json => {} }
    end
  end
end
