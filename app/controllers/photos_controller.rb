class PhotosController < ApplicationController
  def new
    @photo = Photo.new
    render :nothing => true
  end

  def create
    @photo = Photo.create(params[:photo])
    render :nothing => true
  end

  def edit
    @photo = Photo.find params[:id]
  end

  def update
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.delete
      redirect_to photos_path
    else
      flash[:error] = "Screenshot and email me, please.  Not sure how that could've gone wrong."
      redirect_to photos_path
    end
  end
end
