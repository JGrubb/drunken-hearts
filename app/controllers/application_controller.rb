class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def is_user
    authenticate_user!
  end

  def admin_only
    authenticate_user!
    unless current_user.is_admin
      flash[:alert] = "You must be an administrator to go there"
      redirect_to root_path
    end
  end

end
