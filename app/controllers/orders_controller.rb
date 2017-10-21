class OrdersController < ApplicationController
  def index
  end

  def create
    order = Order.new(orders_params)
    order.employee = employee_logged_in
    if order.save
      redirect_to new_part_path
    else
      @errors = order.errors.full_messages
      render :new
    end
  end

  def show
  end

  def new
  end

  private
    def orders_params
      params.require(:order).permit(:description, :warehouse_id)
    end
end
