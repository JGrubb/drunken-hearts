module ApplicationHelper

  def title
    @title.nil? ? "#{@title} | The Drunken Hearts" : "The Drunken Hearts"
  end

  def admin
    return current_user && current_user.is_admin
  end

end
