module ApplicationHelper
  def logged_in?
    return session[:user_id] != nil
  end

  def manager_logged_in?
    employee = Employee.find(session[:user_id])
    return employee.is_manager
  end
end
