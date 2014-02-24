class PhotosController < ApplicationController
  before_filter :is_admin?
  
  def new
    @photo = Photo.new
    render :nothing => true
  end

  def create
    @photo = Photo.create(photo_params)
    render :nothing => true
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
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

  private

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

end

