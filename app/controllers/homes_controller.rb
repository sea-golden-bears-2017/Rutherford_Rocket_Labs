class HomesController < ApplicationController
  def home
    if logged_in?
      render :home
    else
      redirect_to '/login'
    end
  end
end
