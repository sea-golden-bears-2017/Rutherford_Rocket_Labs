class SessionsController < ApplicationController

  def new
    render :login
  end

  def create
    employee = Employee.find_by(employee_id: params[:employee_id])
    if employee && employee.authenticate(params[:password])
      session[:user_id] = employee.id
      redirect_to '/home'
    else
      @error = 'The employee number or password entered is incorrect.'
      render :login
    end
  end

  def destroy
  end
end
