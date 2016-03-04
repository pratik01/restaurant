class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @customers = Customer.all
    respond_with(@customers)
  end

  def show
    respond_with(@customer)
  end

  def new
    @customer = Customer.new
    respond_with(@customer)
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    respond_with(@customer)
  end

  def update
    @customer.update(customer_params)
    respond_with(@customer)
  end

  def destroy
    @customer.destroy
    respond_with(@customer)
  end

  def profile
    @user = current_user
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :contact1, :contact2, :address1, :address2, :country, :state, :city, :zip_code)
    end
end
