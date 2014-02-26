class ProductsController < ApplicationController
  before_action :admin_only, except: :show

end
