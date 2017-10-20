class OrdersController < ApplicationController
  def index
  end

  def create
    if order.save
      4/0
      redirect_to :show
    else
      @errors = order.errors.full_messages
      redirect_to :new
    end
  end

  def show
  end

  def new
  end


  def order_params
    params.require(:order).permit(:name, :description, :warehouse_id, :part_id, :quantity)
  end
end
