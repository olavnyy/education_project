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
    @album = Album.new(album_params)
    render_content(@album.save ? {album: @album, status: true} : {errors: @album.errors, status: false})
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

  private

  def album_params
    params.require(:album).permit(:title, :image, :imageable_type, :imageable_id, :school_id, photos_attributes: [:photo])
  end

end


# class AlbumsController < ApplicationController
#   load_and_authorize_resource
#
#   def index
#     @albums = @current_user.class.albums_list(@current_user)
#     render json: @albums
#   end
#
#   def show
#     @album = @current_user.class.albums_list(@current_user).find(params[:id])
#     @photos = @album.photos
#     render json: @album
#     if @album.nil?
#       @albums = @current_user.class.albums_list(@current_user)
#       render json: @albums
#     end
#   end
#
#   def new
#     @album = @current_user.class.albums_list(@current_user).new
#   end
#
#   def create
#     @album = @current_user.class.albums_list(@current_user).new(album_params)
#     if @album.save
#       render json: @album
#     else
#       render json: {
#         content: 'invalid create'
#       }
#     end
#   end
#
#   def edit
#       @album = @current_user.class.albums_list(@current_user).find(params[:id])
#       @photos = @album.photos
#   end
#
#   def update
#     @album = @current_user.class.albums_list(@current_user).find(params[:id])
#     if @album.update_attributes(album_params)
#       render json: @album
#     else
#       render json: {
#         content: 'invalid update'
#       }
#     end
#   end
#
#   def destroy
#     @album = @current_user.class.albums_list(@current_user).find(params[:id])
#     @album.destroy
#     render json: @albums
#   end
#
#
#   private
#   def album_params
#     params.require(:album).permit(:title, :image, :imageable_type, :imageable_id, :school_id, photos_attributes: [:photo])
#   end
#
# end
