class NewsController < ApplicationController
  def index
     @news = News.all
     render json: @news
   end

   def show
     @news = News.find(params[:id])
     render json: @news
     if @news.nil?
       @news_all = News.all
       render json: @news_all
     end
   end

   def new
     @news = News.new
   end

   def create
     @news = News.new(user_params)
     if @news.save
      render json: @news
     else
       render "new"
     end
   end

   def edit
       @news = News.find(params[:id])
   end

   def update
     @news = News.find(params[:id])
     if @news.update_attributes(news_params)
       render json:@news
     else
       render "edit"
     end
   end

   def destroy
     @news = News.find(params[:id])
     @news.destroy
     render json: @news
   end

   private
   def news_params
     params.require(:news).permit(:title, :image)
   end
end
