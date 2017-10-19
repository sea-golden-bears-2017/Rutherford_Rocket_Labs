class EmployeesController < ApplicationController

  def new
    @employee = Employee.new()
  end

  def create
  end

  private
  def user_params
  end


end
