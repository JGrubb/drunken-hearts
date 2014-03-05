class CartsController < ApplicationController
  def show
    @cart = current_cart
    @title = "Your cart"
  end
end
