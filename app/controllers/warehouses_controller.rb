class WarehousesController < ApplicationController

  def new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    @warehouse.location_id = SecureRandom.hex(13)
    @warehouse.save
    # FIX MEEEEEEEEEEEEEEEEEEEEEEE WITH THIS:
    # render_template :view_to_go_to
    redirect_to 'root_path'
  end

  private
  def warehouse_params
    params.require(:warehouse).permit(:city)
  end

end
