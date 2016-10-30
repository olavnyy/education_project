class LevelsController < ApplicationController
  load_and_authorize_resource

  def index
    @levels = @current_user.class.levels_list(@current_user)
    render json: @levels
  end

  def show
    @level = @current_user.class.levels_list(@current_user).find(params[:id])
    if @level.nil?
      render json: {
        content: 'invalid show'
      }
    else
      render json: @level
    end
  end

  def create
    @level = @current_user.class.levels_list(@current_user).new(level_params)
    if @level.save
      render json: @level
    else
      render json: {
        content: 'invalid create'
      }
    end
  end

  def update
    @level = @current_user.class.levels_list(@current_user).find(params[:id])
    if @level.update_attributes(level_params)
      render json: @level
    else
      render json: {
        content: 'invalid update'
      }
    end
  end

  def destroy
    @current_user.class.levels_list(@current_user).find(params[:id]).destroy
    render json: {
      content: 'deleted'
    }
  end

  # This not working yet
  # def new
  #   @level = @current_user.class.levels_list(@current_user).new
  #   render json: @level
  # end

  # This not working yet
  # def edit
  #   @level = @current_user.class.levels_list(@current_user).find(params[:id])
  # end

  private

  def level_params
    params.require(:level).permit(:name, :school_id)
  end
end
