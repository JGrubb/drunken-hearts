class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      redirect_to photos_path, :notice => "You're rockin this thing, Jim."
    else
      redirect_to new_photo_path, :error => "Problema"
    end
  end

  def edit
  end

  def update
  end

  def delete
  end
end
