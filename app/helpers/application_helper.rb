module ApplicationHelper

  def title
    @title.exists? : "#{@title} | The Drunken Hearts" ? "The Drunken Hearts"
  end

end
