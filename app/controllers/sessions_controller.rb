class SessionsController < ApplicationController

  def new
    render :login
  end

  def create
    employee = Employee.find_by(employee_id: params[:employee_id])
    if employee
      session[:user_id] = employee.id
      redirect_to '/home'
    else
      redirect_to '/login'
    end
  end

  def destroy
  end
end
