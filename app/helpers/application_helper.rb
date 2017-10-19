module ApplicationHelper
  def logged_in?
    return session[:employee_id] != nil
  end
end
