class NewsController < ApplicationController
  load_and_authorize_resource

  def index
     @news = @current_user.class.news_list(@current_user)
     render json: @news
   end

  def show
    @news = @current_user.class.news_list(@current_user).find(params[:id])
    render json: @news
  end

  def create
    @news = @current_user.class.news_list(@current_user).new(news_params)
    if @news.save
     render json: @news
    else
      render json: {
        content: 'invalid create'
      }
    end
  end

   def update
     @news = @current_user.class.news_list(@current_user).find(params[:id])
     if @news.update_attributes(news_params)
       render json:@news
     else
       render json: {
        content: 'invalid save'
       }
     end
   end

   def destroy
     @news = @current_user.class.news_list(@current_user).find(params[:id])
     @news.destroy
     render json: {
      content: 'deleted'
    }
   end

   private
   def news_params
     params.require(:news).permit(:title, :description, :viewable_type, :viewable_id)
   end
end
