class OrdersController < ApplicationController
  before_filter :admin_only, :except => [:new, :create]
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_path, :notice => "Your cart is empty."
      return
    end

    @order = Order.new

    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)
    if @order.save
      redirect_to order_confirmation_path(@order.guid)
    else
      render :action => :new
    end
  end

  def confirm
    @order = Order.find_by(:guid => params[:guid])
    #  Cart.destroy(session[:cart_id])
    #  session[:cart_id] = nil
  end

  def index
    @orders = Order.order(:created_at).reverse_order
  end

  def show
    @order = Order.find_by(:guid => params[:id])
  end

  private
    
  def order_params
    params.require(:order).permit(:email, :address)
  end

end
