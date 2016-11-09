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
    @level.write_attribute(:school_id, @current_user.school_id)
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
    @current_user.type?('Admin') ? @current_user.school.levels : @current_user.levels
  end

  def level_params
    params.require(:level).permit(:name, :school_id)
  end
end
