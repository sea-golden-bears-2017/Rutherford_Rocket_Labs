class WarehousesController < ApplicationController

  def new
  end

  def create
    warehouse = Warehouse.new(warehouse_params)
    warehouse.location_code = "#{warehouse.city.upcase[0..2]}-#{rand(10000..99999).to_s}"
    warehouse.save
    redirect_to 'root_path'
  end

  private
  def warehouse_params
    params.require(:warehouse).permit(:city)
  end

end
