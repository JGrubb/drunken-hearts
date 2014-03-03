class StoreController < ApplicationController
  def index
    @products = Product.published
  end
end
