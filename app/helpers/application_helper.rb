module ApplicationHelper

  def title
    @title.nil? ? "#{@title} | The Drunken Hearts" : "The Drunken Hearts"
  end

end
