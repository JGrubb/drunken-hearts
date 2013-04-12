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
  end

  def update
  end

  def delete
  end
end
