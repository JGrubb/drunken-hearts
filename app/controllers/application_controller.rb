class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private

  def admin_only
    authenticate_user!
    unless current_user.is_admin
      flash[:alert] = "You must be an administrator to go there"
      redirect_to root_path
    end
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end
