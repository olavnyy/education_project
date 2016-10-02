class GroupsController < ApplicationController
  def index
    @group = Group.all
    render json: @group
  end

  def show
    @group = Group.find(params[:id])
    if @group.nil?
      render 'index'
    else
      render json: @group
    end
  end

  def new
    @group = Group.new
    render json: @group
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group
      render json: @group
    else
      render 'new'
    end

  end

  def edit
    @group = Group.find(params[:id])
    render json: @group
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      render json: @group
    else
      render 'edit'
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    render json: @group
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
