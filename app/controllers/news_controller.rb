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
    render_content(@news.save ? {news: @news, status: true} : {errors: @news.errors, status: false})
  end

  def update
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

   def news_params
     params.require(:news).permit(:title, :description, :image, :created_at, :imageable_type, :imageable_id)
   end
end

# class NewsController < ApplicationController
#   load_and_authorize_resource
#
#   def index
#      @news = @current_user.class.news_list(@current_user)
#      render json: @news
#    end
#
#    def show
#      @news = @current_user.class.news_list(@current_user).find(params[:id])
#      render json: @news
#      if @news.nil?
#        @news_all = @current_user.class.news_list(@current_user)
#        render json: @news_all
#      end
#    end
#
#    def new
#      @news = @current_user.class.news_list(@current_user)
#    end
#
#    def create
#      @news = @current_user.class.news_list(@current_user).new(news_params)
#      if @news.save
#       render json: @news
#      else
#        render json: {
#         content: 'invalid create'
#        }
#      end
#    end
#
#    def edit
#       @news = @current_user.class.news_list(@current_user).find(params[:id])
#    end
#
#    def update
#      @news = @current_user.class.news_list(@current_user).find(params[:id])
#      if @news.update_attributes(news_params)
#        render json:@news
#      else
#        render json: {
#         content: 'invalid update'
#        }
#      end
#    end
#
#    def destroy
#      @news = @current_user.class.news_list(@current_user).find(params[:id])
#      @news.destroy
#      render json: {
#       content: 'deleted'
#     }
#    end
#
#    private
#    def news_params
#      params.require(:news).permit(:title, :description, :image, :created_at, :imageable_type, :imageable_id)
#    end
# end
