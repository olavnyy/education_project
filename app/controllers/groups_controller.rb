class GroupsController < ApplicationController
  load_and_authorize_resource

  def index
    @groups =  @current_user.class.groups_list(@current_user)
    render json: @groups
  end

  def show
    @group =  @current_user.class.groups_list(@current_user).find(params[:id])
    if @group.nil?
      render json: {
        content: 'invalid show'
      }
    else
      render json: @group
    end
  end

  def create
    @group =  @current_user.class.groups_list(@current_user).new(group_params)
    if @group.save
      render json: @group
    else
      render json: {
        content: 'invalid create'
      }
    end
  end

  def update
    @group =  @current_user.class.groups_list(@current_user).find(params[:id])
    if @group.update_attributes(group_params)
      render json: @group
    else
      render json: {
        content: 'invalid update'
      }
    end
  end

  def destroy
     @current_user.class.groups_list(@current_user).find(params[:id]).destroy
    render json: {
      content: 'deleted'
    }
  end

  # This not working yet
  def new
    @group =  @current_user.class.groups_list(@current_user).new
    render json: @group
  end

  # This not working yet
  def edit
    @group =  @current_user.class.groups_list(@current_user).find(params[:id])
    render json: @group
  end

  private

  def group_params
    params.require(:group).permit(:name, :level_id, :school_id)
  end
end
