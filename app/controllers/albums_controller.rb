class AlbumsController < ApplicationController
  load_and_authorize_resource

  def index
    @albums = @current_user.class.albums_list(@current_user)
    render json: @albums
  end

  def show
    @album = @current_user.class.albums_list(@current_user).find(params[:id])
    @photos = @album.photos
    render json: @album
  end

  def create
    @album = @current_user.class.albums_list(@current_user).new(album_params)
    if @album.save
      render json: @album
    else
      render json: {
        content: 'invalid create'
      }
    end
  end

  def update
    @album = @current_user.class.albums_list(@current_user).find(params[:id])
    if @album.update_attributes(album_params)
      render json: @album
    else
      render json: {
        content: 'invalid update'
      }
    end
  end

  def destroy
    @album = @current_user.class.albums_list(@current_user).find(params[:id])
    @album.destroy
  end


  private
  def album_params
    params.require(:album).permit(:title, :image)
  end

end
