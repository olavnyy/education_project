class LevelsController < ApplicationController
  def index
    @level = Level.all
    render json: @level
  end

  def show
    @level = Level.find(params[:id])
    if @level.nil?
      render 'index'
    else
      render json: @level
    end
  end

  def new
    @level = Level.new
    render json: @group
  end

  def create
    @level = Level.new(level_params)
    respond_to do |format|
      if @level.save
        redirect_to @level
      else
        render 'new'
      end
    end
  end

  def edit
    @level = Level.find(params[:id])
  end

  def update
    @level = Level.find(params[:id])
    if @level.update_attributes(level_params)
     render json: @level
    else
      render 'edit'
    end
  end

  def destroy
    Level.find(level_params).destroy
    render json: @level
  end

  private

  def level_params
    params.require(:level).permit(:name)
  end
end
