class HomeController < ApplicationController
  layout 'landing'
  def index
  end
  
  def logout
    destroy_user_session_path
    sign_out current_user 
    sign_out current_freelance
    sign_out current_client 
    redirect_to "/"
  end
end
