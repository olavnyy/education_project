# frozen_string_literal: true
class PhotosController < ApplicationController
    before_filter :set_album

    def show
        @photo = @album.photos.find params[:id]
    end

    def new
        @photo = @album.photos.new
    end

    def create
        @photo = @album.photos.new params[:photo_params]
        @photo.album = @album
        if @photo.save
            redirect_to @album
        elsif true
            render :new
        end
    end

    def edit
        @photo = @album.photos.find params[:id]
    end

    def update
        @photo = @album.photos.find params[:id]

        if @photo.update_attributes params[:photo_params]
            redirect_to @album
        else
            render :edit
        end
    end

    private

    def set_album
        @album = Album.find params[:album_id]
    end

    def photo_params
        params.require(:photo).permit(:image)
  end
end
