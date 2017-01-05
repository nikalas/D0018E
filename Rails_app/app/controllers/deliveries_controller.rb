class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]
  include DeliveriesHelper

  # GET /deliveries
  # GET /deliveries.json
  def index
    if current_user.permission >= 1
      @deliveries = Delivery.all
    else 
      @deliveries = Delivery.where(customer_id: current_user.id)
    end
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
  def show
  end

  # GET /deliveries/new
  def new
    @delivery = Delivery.new
    @customers = Customer.all
    @carts = Cart.all
  end

  # GET /deliveries/1/edit
  def edit
    @customers = Customer.all
    @carts = Cart.all
  end

  def check_out
    if check_stock
      if logged_in?
          @delivery = Delivery.create(customer_id: current_user.id, cart_id: current_cart.id, adress: current_user.adress, zip: current_user.zip, city: current_user.city)
      else
        @delivery = Delivery.create(cart_id: current_cart.id)
      end
      @delivery.total = current_cart.total
      @delivery.save
      current_cart.used = true
      current_cart.save
      current_cart = nil
      session[:cart_id] = nil

      redirect_to order_path(@delivery)
    else
      redirect_to current_cart, :flash => { :error => "För många av någon vara. Var vänlig justera kundkorgen eller vända tills vi har fått in fler."}
    end
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @delivery = Delivery.new(delivery_params)

    respond_to do |format|
      if @delivery.save
        format.html { redirect_to @delivery, notice: 'Delivery was successfully created.' }
        format.json { render :show, status: :created, location: @delivery }
      else
        format.html { render :new }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliveries/1
  # PATCH/PUT /deliveries/1.json
  def update
    respond_to do |format|
      if @delivery.update(delivery_params)
        format.html { redirect_to @delivery, notice: 'Delivery was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery }
      else
        format.html { render :edit }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery.destroy
    respond_to do |format|
      format.html { redirect_to deliveries_url, notice: 'Delivery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_params
      params.require(:delivery).permit(:customer_id, :cart_id, :adress, :zip, :city, :payed, :shipped, :order_date)
    end
end
