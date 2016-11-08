class LevelsController < ApplicationController
  load_and_authorize_resource
  before_action :set_level, only: [:show, :update, :destroy]

  def index
    render_content(levels_list)
  end

  def show
    render_content(@level)
  end

  def create
    @level = Level.new(level_params)
    render_content(@level.save ? {level: @level, status: true} : {errors: @level.errors, status: false})
  end

  def update
    render_content(@level.update_attributes(level_params) ? {level: @level, status: true} : {errors: @level.errors, status: false})
  end

  def destroy
    render_content({status: (@level && @level.destroy ? true : false)})
  end

  private

  def set_level
    @level = levels_list.find_by(id: params[:id])
  end

  def levels_list
    @current_user.school.levels if @current_user.type?('Admin')
  end

  def level_params
    params.require(:level).permit(:name, :school_id)
  end
end


# class LevelsController < ApplicationController
#   load_and_authorize_resource
#
#   def index
#     @levels = @current_user.class.levels_list(@current_user)
#     render json: @levels
#   end
#
#   def show
#     @level = @current_user.class.levels_list(@current_user).find(params[:id])
#     if @level.nil?
#       render json: {
#         content: 'invalid show'
#       }
#     else
#       render json: @level
#     end
#   end
#
#   def create
#     @level = @current_user.class.levels_list(@current_user).new(level_params)
#     if @level.save
#       render json: @level
#     else
#       render json: {
#         content: 'invalid create'
#       }
#     end
#   end
#
#   def update
#     @level = @current_user.class.levels_list(@current_user).find(params[:id])
#     if @level.update_attributes(level_params)
#       render json: @level
#     else
#       render json: {
#         content: 'invalid update'
#       }
#     end
#   end
#
#   def destroy
#     @current_user.class.levels_list(@current_user).find(params[:id]).destroy
#     render json: {
#       content: 'deleted'
#     }
#   end
#
#   # This not working yet
#   def new
#     @level = @current_user.class.levels_list(@current_user)
#     render json: @level
#   end
#
#   # This not working yet
#   def edit
#     @level = @current_user.class.levels_list(@current_user).find(params[:id])
#   end
#
#   private
#
#   def level_params
#     params.require(:level).permit(:name)
#   end
# end
