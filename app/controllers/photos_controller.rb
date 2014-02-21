class PhotosController < ApplicationController
  before_filter :is_user
  
  def new
    @photo = Photo.new
    render :nothing => true
  end

  def create
    @photo = Photo.create(params[:photo])
    render :nothing => true
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      redirect_to photos_path
    end
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
