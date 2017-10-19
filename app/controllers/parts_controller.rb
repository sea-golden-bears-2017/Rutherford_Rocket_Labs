class PartsController < ApplicationController

def index
end

def show
  part = Part.find(params[:id])
  @parts = Part.all_of_type(part.part_no)
end

end
