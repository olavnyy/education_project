class GroupsController < ApplicationController
  def index
    @groups = Group.all
    render json: @groups
  end

  def show
    @group = Group.find(params[:id])
    if @group.nil?
      render json: {
        content: 'invalid show'
      }
    else
      render json: @group
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      render json: @group
    else
      render 'new'
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      render json: @group
    else
      render json: {
        content: 'invalid update'
      }
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    render json: {
      content: 'deleted'
    }
  end

  # This not working yet
  def new
    @group = Group.new
    render json: @group
  end

  # This not working yet
  def edit
    @group = Group.find(params[:id])
    render json: @group
  end

  private

  def group_params
    params.require(:group).permit(:name, :level_id, :school_id)
  end
end
