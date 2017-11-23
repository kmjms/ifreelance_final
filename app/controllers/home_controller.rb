class HomeController < ApplicationController
  layout 'landing'
  def index
  end
  
  def logout
    sign_out :freelance 
    redirect_to "/"
  end
end
