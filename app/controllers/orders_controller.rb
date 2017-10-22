class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
    order = Order.new(orders_params)
    order.employee = employee_logged_in
    if order.save
      flash.clear
      redirect_to new_part_path
    else
      @errors = order.errors.full_messages
      render :new
    end
  end

  def new
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirmation
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    if quantity_received_zero?
      flash.clear
      @order = Order.find(params[:id])
      flash.alert = "Please enter quantities received"
      render :edit
    else
      update_parts
      flash[:notice] = "Your new inventory has been added!"
      redirect_to root_path
    end
  end

  private
    def orders_params
      params.require(:order).permit(:description, :warehouse_id)
    end
end
