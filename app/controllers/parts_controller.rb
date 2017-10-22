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

def remove
   part = Part.find(params[:id])
   part.removed = true
   part.removed_by_id = employee_logged_in.id
   part.save
   @parts = Part.all_of_type_in_inventory(part.part_no)
   render :show
 end


private


end
