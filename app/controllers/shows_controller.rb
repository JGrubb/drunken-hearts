class ShowsController < ApplicationController
  before_filter :is_admin?
  
  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      flash[:notice] = "Nice job, Jim."
      redirect_to shows_path
    else
      flash[:error] = "Not sure what happened there, but try it again.  Date, show, and venue are all required."
      render :new
    end
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    if @show.update(show_params)
      redirect_to shows_path, :notice => "Nice job there, jimbo."
    else
      redirect_to edit_show_path(@show), :alert => "You screwed something up there, buddy."
    end
      
  end

  def destroy
    @show = Show.find(params[:id])
    if @show.delete
      redirect_to shows_path, :notice => "That show was gonna suck anyway."
    else
      redirect_to shows_path, :notice => "I'm not really sure how you could mess up deleting a show, so if this keeps happening you need to email me right now so I can check the logs and fix it."
    end
  end

  private

  def show_params
    params.require(:show).permit(:city, :date, :info, :tickets_link, :venue, :venue_link)
  end

end
