class WarehousesController < ApplicationController

  def new
    if manager_logged_in?
      @warehouse = Warehouse.new()
      render :new
    else
      redirect_to home_path
    end
  end

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def create
    warehouse = Warehouse.new(warehouse_params)
    warehouse.location_code = "#{warehouse.city.upcase[0..2]}-#{rand(10000..99999).to_s}"
<<<<<<< HEAD
    if warehouse.save
      redirect_to warehouse_path(warehouse)
    else
      # FIXME incorporate error handling
      render :new
    end
=======
    warehouse.save
    redirect_to root_path
>>>>>>> master
  end

  private
  def warehouse_params
    params.require(:warehouse).permit(:city)
  end

end
