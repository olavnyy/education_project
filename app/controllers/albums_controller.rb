class AlbumsController < ApplicationController
  load_and_authorize_resource
  before_action :set_album, only: [:show, :update, :destroy]

  def index
    render_content(albums_list)
  end

  def show
    render_content(@album)
    @photos = @album.photos
  end

  def create
    @album = Album.create(album_params)
    if params[:photos]
      @album.photos.create(parse_photos)
      render_content(@album ? {album: @album, status: true} : {errors: @album.errors, status: false})
    end
  end

  def update
    render_content(@album.update_attributes(album_params) ? {album: @album, status: true} : {errors: @album.errors, status: false})
  end

  def destroy
    render_content({status: (@album && @album.destroy ? true : false)})
  end

  private

  def set_album
    @album = albums_list.find_by(id: params[:id])
  end

  def albums_list
    @current_user.class.albums_list(@current_user)
  end

  def album_params
    params.require(:album).permit(:title, :image, :imageable_type, :imageable_id, :school_id)
  end

  def parse_photos
    params[:photos].map do |img|
      { image: decode_base64_image(img) }
    end
  end
end
