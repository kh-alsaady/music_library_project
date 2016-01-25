class CustomersController < ApplicationController
  #Callback methods
  before_action :confirm_logged_in
  before_action :set_customer, :only=>[:show, :edit, :update, :delete, :destroy]
  
  # GET /customers
  def index
    @customers = Customer.all 
  end

  # GET /customers/1
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      flash[:notice]= 'customer was successfully created.'
      redirect_to(customers_path)
    else
      render('new')      
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update_attributes(customer_params)
      flash[:notice]= 'customer was successfully updated.'
      redirect_to(customer_path(@customer.id))       
    else
      render('edit')
    end
  end

  # DELETE /customers/1
  def delete
  end

  def destroy
    @customer.destroy
    flash[:notice]= 'customer was successfully deleted.' 
    redirect_to(customers_path)
  end

  private #-------------------------------------------------------------
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      #params[:customer]
      params.require(:customer).permit(:first_name,:last_name,:zip_code)
    end

end
