class NewsController < ApplicationController
  def index
     @news = News.all
   end

   def show
     @news = News.find(params[:id])
     if @news.nil?
       @news = News.all
       flash.now[:alert] = "Your news was not found!"
       render "index"
     end
   end

   def new
     @news = News.new
   end

   def create
     @news = News.new(user_params)
     if @news.save
       flash[:success] = "news created!"
       redirect_to '/news'
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
       redirect_to(:action => 'show', :id => @news.id)
     else
       render "edit"
     end
   end

   def destroy
     @news = News.find(params[:id])
     @news.destroy
     flash[:success] = "news deleted"
     redirect_to :action => "index"
   end

   private
   def news_params
     params.require(:news).permit(:title, :image)
   end
end
