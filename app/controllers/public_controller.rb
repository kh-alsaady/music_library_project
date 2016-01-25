class PublicController < ApplicationController
  
  before_action :find_or_create_cart ,:except => [:index]

  def index
  	@albums = Album.all
  end
  
  def add_to_cart
	  album = Album.find(params[:id])
    @cart.add_album(album)
    flash[:notice] ="album was successfully added to your cart."
	  redirect_to(:action=>'show_cart')  
  end

  def show_cart
  end

  def empty_cart
    @cart.empty_all_items
    $cart = nil
    flash[:notice] ="Your shopping cart was successfully emptied."
    redirect_to(:action => 'index')
  end

  def remove_from_cart
    album = Album.find(params[:id])
    @cart.remove_from_cart(album)
    flash[:notice] ="album was successfully removed from your cart."
    redirect_to(:action=>'show_cart')  
  end

  def checkout
    @customer = Customer.new
  end

  def safe_order
    @customer = (Customer.where(:first_name => params[:customer][:first_name],
                :last_name => params[:customer][:last_name],:zip_code => params[:customer][:zip_code]).first) || Customer.new(params_customer)
    
    credit_card_number = params[:credit_card]
    
    order = Order.new
    last_order = Order.all.sort.last 
    invoice_number = (last_order.invoice_number + 1 if last_order) || 1
    order.invoice_number = invoice_number
    order.line_items << @cart.items
    @customer.orders << order
    if @customer.save
      #Try process payment
      #if payment fails send user to fix-it page
      #if payment succeeds
      @cart.empty_all_items
      flash[:notice] = 'Your order done successfully.'
      redirect_to(:action=>'show_receipt',:order_id => order.id)
    else 
     render('checkout')
    end
  end

  def show_receipt
    @order = Order.find(params[:order_id])
  end

  private #-------------------------------------------------------------------

  def find_or_create_cart
    @cart = $cart ||= Cart.new
  end

  def params_customer
    params.require(:customer).permit(:first_name,:last_name,:zip_code)
  end
end
