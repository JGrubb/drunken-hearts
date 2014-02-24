class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def is_user
    authenticate_user!
  end

  def is_admin?
    authenticate_user! && current_user.is_admin?
  end

end
