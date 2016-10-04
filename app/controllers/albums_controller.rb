class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    render json: @albums
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos
    render json: @album
    if @album.nil?
      @albums = Album.all
      flash.now[:alert] = "Your album was not found!"
      render json: @albums
    end
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:success] = "Album created!"
      render json: @album
    else
      render "new"
    end
  end

  def edit
      @album = Album.find(params[:id])
      @photos = @album.photos
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      render json: @album
    else
      render "edit"
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:success] = "Album deleted"
    render json: @albums
  end


  private
  def album_params
    params.require(:album).permit(:title, :image)
  end

end
