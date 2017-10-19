class HomesController < ApplicationController
  def home
    session[:user_id] = true
    if logged_in?
      render :home
    else
      redirect_to '/login'
    end
  end
end
