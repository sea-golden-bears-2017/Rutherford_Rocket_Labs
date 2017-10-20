class WarehousesController < ApplicationController

  def new
    if manager_logged_in?
      @warehouse = Warehouse.new()
      render :new
    else
      redirect_to home_path
    end
  end

  def confirmation
    @warehouse = Warehouse.find(params[:id])
  end

  def create
    warehouse = Warehouse.new(warehouse_params)
    warehouse.location_code = "#{warehouse.city.upcase[0..2]}-#{rand(10000..99999).to_s}"
    if warehouse.save
      warehouse.save
      redirect_to confirmation_path(warehouse)
    else
      @errors = warehouse.errors.full_messages
      render :new
    end
  end

  private
  def warehouse_params
    params.require(:warehouse).permit(:city)
  end

end
