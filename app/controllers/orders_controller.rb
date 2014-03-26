class OrdersController < ApplicationController
  before_filter :admin_only, :except => [:new, :create, :confirm, :purchase, :show]
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
  end

  def purchase
    @order = Order.find_by(:guid => params[:guid])
    @order.charge_card
    sale = @order.create(
      amount:       @order.total,
      email:        params[:email],
      stripe_token: params[:stripeToken]
    )
    sale.process!
    if sale.finished?
      redirect_to show_order_url(guid: order.guid)
    else
      flash.now[:alert] = sale.error
      render :new
    end
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
