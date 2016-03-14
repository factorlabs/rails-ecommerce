class OrdersController < ApplicationController
  before_action :set_order, only: [:update, :destroy]

  # GET /orders/test
  def order
    @order = OrderProxy.new(session)
    @order.user = User.find(current_user.id)
    @order.product = Product.find(1)
    
    @order2 = OrderProxy.new(session)
    @order2.user = User.find(current_user.id)
    @order2.product = Product.find(2)
    
    @sess = session
    render "orders/order"
  end
  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.fetch(:order, {})
    end
end
