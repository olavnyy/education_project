class LevelsController < ApplicationController
  def index
    @levels = Level.all
    render json: @levels
  end

  def show
    @level = Level.find(params[:id])
    if @level.nil?
      render 'index'
    else
      render json: @level
    end
  end

  def create
    @level = Level.new(level_params)
    if @level.save
      render json: @level
    else
      render json: {
        content: 'invalid create'
      }
    end
  end

  def update
    @level = Level.find(params[:id])
    if @level.update_attributes(level_params)
      render json: @level
    else
      render json: {
        content: 'invalid update'
      }
    end
  end

  def destroy
    Level.find(params[:id]).destroy
    render json: {
      content: 'deleted'
    }
  end

  # This not working yet
  def new
    @level = Level.new
    render json: @level
  end

  # This not working yet
  def edit
    @level = Level.find(params[:id])
  end

  private

  def level_params
    params.require(:level).permit(:name)
  end
end
