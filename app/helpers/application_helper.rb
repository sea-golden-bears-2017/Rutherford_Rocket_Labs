module ApplicationHelper
  def logged_in?
    return session[:user_id] != nil
  end

  def manager?
    user = User.find(session[:user_id])
    return user.manager
  end
end
