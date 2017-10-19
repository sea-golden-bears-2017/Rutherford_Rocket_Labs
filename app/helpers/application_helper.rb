module ApplicationHelper
  def logged_in?
    return session[:user_id] != nil
  end

  def manager_logged_in?
    employee = Employee.find(session[:user_id])
    return employee.is_manager
  end

  def employee_logged_in
    Employee.find(session[:user_id])
  end
end
