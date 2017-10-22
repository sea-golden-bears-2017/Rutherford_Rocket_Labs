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
  if quantity_zero?
    flash[:notice] = "Please enter valid quantities"
    render :new
  else
    @order = Order.last
    create_parts
    @parts = @order.parts
    flash.clear
    redirect_to affirm_path(@order)
  end
end

def new_line
  render '_new_line', layout: false
end

def show
  if logged_in?
    part = Part.find(params[:id])
    @parts = Part.all_of_type_in_inventory(part.part_no)
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

def remove
   part = Part.find(params[:id])
   part.removed = true
   part.removed_by_id = employee_logged_in.id
   part.save
   @parts = Part.all_of_type_in_inventory(part.part_no)
   render :show
 end


private

def parts_params
  params.require(:part).permit(:warehouse_id)
end

end
