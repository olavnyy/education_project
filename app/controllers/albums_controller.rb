class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id]
    @photos = @album.photos
    if @album.nil?
      @albums = Album.all
      flash.now[:alert] = "Your album was not found!"
      render "index"
    end
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(user_params)
    if @album.save
      flash[:success] = "Album created!"
      redirect_to @album
    else
      render "new"
    end
  end

  def edit
      @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to @album
    else
      render "edit"
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:success] = "Album deleted"
    redirect_to albums_url
  end


  private
  def album_params
    params.require(:album).permit(:title, :image)
  end

end

