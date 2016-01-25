class OrdersController < ApplicationController
 #Callback methods
  before_action :confirm_logged_in
  before_action :set_order, :only=>[:show, :edit, :update, :delete, :destroy]
  #before_action :set_customers,:only=>[:new,:edit,:create,:update]
  
  # GET /orders
  def index
    @orders = Order.where(:customer_id => params[:customer_id])
    @order  = @orders.first 
  end

  # GET /orders/1
  def show
  end

  # # GET /orders/new
  # def new
  #   #@order = Order.new
  # end

  # # GET /orders/1/edit
  # def edit
  # end

  # # POST /orders
  # def create
  #   @order = Order.new(order_params)

  #   if @order.save
  #     flash[:notice]= 'order was successfully created.'
  #     redirect_to(orders_path)
  #   else            
  #     render('new')      
  #   end
  # end

  # PATCH/PUT /orders/1
  # def update    
  #   if @order.update_attributes(order_params)
  #     flash[:notice]= 'order was successfully updated.'
  #     redirect_to(order_path(@order.id))       
  #   else
  #     render('edit')
    
  #   end
  # end

  # DELETE /orders/1
  def delete
  end

  def destroy
    @order.destroy
    flash[:notice]= 'order was successfully deleted.' 
    redirect_to(orders_path(:customer_id => @order.customer.id))
  end

  private #-------------------------------------------------------------
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # def set_customers
    #   @customers=Customer.all   ||= []
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def order_params
    #   #params[:order]
    #   params.require(:order).permit(:invoice_number,:customer_id)
    # end
end
