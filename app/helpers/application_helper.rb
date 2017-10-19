module ApplicationHelper
  def logged_in?
    return session[:user_id] != nil
  end

  def manager_logged_in?
    if logged_in?
      employee = Employee.find(session[:user_id])
      return employee.is_manager
    else
      nil
    end
  end

  def employee_logged_in
    return Employee.find(session[:user_id]) if logged_in?
    nil
  end
end
