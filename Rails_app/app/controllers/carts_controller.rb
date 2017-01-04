class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    if !logged_in?
      flash[:error] = "Loggin to view your carts"
      redirect_to root_path
    elsif logged_in? && current_user.permission == 1
      @carts = Cart.where(customer_id: current_user.id)
    else
      @carts = Cart.all
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  def add_to_cart
      current_cart.add_item(params[:product_id].to_i, params[:quantity].to_i)
  end
  
  def remove_from_cart
      current_cart.remove_item(params[:product_id].to_i, params[:quantity].to_i)
  end

  def remove_all_from_cart
      CartItem.find(params[:product_id].to_i).destroy
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:products, :customer_id)
    end
end
