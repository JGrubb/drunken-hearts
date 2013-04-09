class ShowsController < ApplicationController
  before_filter :is_user
  def new
    @show = Show.new
  end

  def create
    @show = Show.new(params[:show])
    if @show.save
      flash[:notice] = "Nice job, Jim."
      redirect_to shows_path
    else
      flash[:error] = "Not sure what happened there, but try it again.  Date, show, and venue are all required."
      redirect_to new_show_path
    end
  end

  def edit
  end

  def update
  end

  def delete
  end
end
