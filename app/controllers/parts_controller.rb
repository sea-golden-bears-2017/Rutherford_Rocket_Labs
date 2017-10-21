class PartsController < ApplicationController

def index
  if logged_in?
    render :index
  else
    redirect_to '/'
  end
end

def new
end

def create
  @order = Order.last
  create_parts
  @parts = @order.parts
  redirect_to affirm_path(@order)
end

def show
  if logged_in?
    part = Part.find(params[:id])
    @parts = Part.all_of_type(part.part_no)
  else
    redirect_to '/'
  end
end

def edit
  @part = Part.find(params[:id])
  if manager_logged_in?
    render :edit
  else
    redirect_to part_path(@part)
  end
end

def update
  ##FIXME show routes reflects part number. consider updating to name instead
  part = Part.find(params[:id])
  if parts_params[:warehouse_id] != part.warehouse_id
    part.update(parts_params)
    flash[:success] = "You transferred Part #{part.id} '#{part.part_no} #{part.name}' to Warehouse #{part.warehouse.location_code}"
    redirect_to part_path(part)
  else
    redirect_to part_path(part)
  end
end


private

def parts_params
  params.require(:part).permit(:warehouse_id)
end

end
