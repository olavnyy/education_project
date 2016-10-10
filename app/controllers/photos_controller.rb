class PhotosController < ApplicationController
    before_action :set_album

    def index
      @photos = @album.photos.all
      render json: @photos
    end

    def show
      @photo = @album.photos.find(params[:id])
      render json: @photo
    end

    def new
      @photo = @album.photos.new
    end

    def create
      @photo = @album.photos.new params[:photo_params]
      @photo.album = @album
      if @photo.save
        render json: @album
      else
        render :new
      end
    end

    def edit
      @photo = @album.photos.find(params[:id])
    end

    def update
      @photo = @album.photos.find(params[:id])

      if @photo.update_attributes params[:photo_params]
        render json: @album
      else
        render :edit
      end
    end

    def destroy
      @photo = @album.photos.find(params[:id])
      @photo.destroy
    end

    private

    def set_album
      @album = Album.find(params[:album_id])
    end

    def photo_params
      params.require(:photo).permit(:image)
  end
end
