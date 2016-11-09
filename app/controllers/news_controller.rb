class NewsController < ApplicationController
  load_and_authorize_resource
  before_action :set_news, only: [:show, :update, :destroy]

  def index
    render_content(news_list)
  end

  def show
    render_content(@news)
  end

  def create
    @news = News.new(news_params)
    add_image
    @news.user_id = @current_user.id
    render_content(@news.save ? {news: @news, status: true} : {errors: @news.errors, status: false})
  end

  def update
    add_image
    render_content(@news.update_attributes(news_params) ? {news: @news, status: true} : {errors: @news.errors, status: false})
  end

  def destroy
    render_content({status: (@news && @news.destroy ? true : false)})
  end

  private

  def set_news
    @news = news_list.find_by(id: params[:id])
  end

  def news_list
    @current_user.class.news_list(@current_user)
  end

  private

  def add_image
    @news.image = decode_base64_image(params[:image]) if params[:image] && @news
  end

  def news_params
    params.require(:news).permit(:title, :description, :image, :created_at, :imageable_type, :imageable_id, :user_id)
  end
end