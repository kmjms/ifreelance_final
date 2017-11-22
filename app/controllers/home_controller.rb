class HomeController < ApplicationController
  layout 'landing'
  def index
  end
  
  def logout
    reset_session
    redirect_to "/"
  end
end
