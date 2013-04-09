class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def is_user
    authenticate_user!
  end
end
