class HomesController < ApplicationController
  def show
    if logged_in?
      render :home
    else
      redirect_to '/login'
    end
  end
end
