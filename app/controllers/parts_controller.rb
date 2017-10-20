class PartsController < ApplicationController

def index
  if logged_in?
    render :index
  else
    redirect_to '/'
  end
end

def show
  if logged_in?
    part = Part.find(params[:id])
    @parts = Part.all_of_type(part.part_no)
  else
    redirect_to '/'
  end
end

end
