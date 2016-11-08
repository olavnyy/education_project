class GroupsController < ApplicationController
  load_and_authorize_resource
  before_action :set_group, only: [:show, :update, :destroy]


  def index
    render_content(groups_list)
  end

  def show
    render_content(@group)
  end

  def create
    @group = Group.new(group_params)
    school = get_current_school
    @group.write_attribute(:school_id, school)
    render_content(@group.save ? {group: @group, status: true} : {errors: @group.errors, status: false})
  end

  def update
    render_content(@group.update_attributes(group_params) ? {group: @group, status: true} : {errors: @group.errors, status: false})
  end

  def destroy
     render_content({status: (@group && @group.destroy ? true : false)})
  end

  private

  def set_group
    @group = groups_list.find_by(id: params[:id])
  end

  def groups_list
    @current_user.type?('Admin') ? @current_user.school.groups : @current_user.groups
  end

  def get_current_school
    @current_user.attributes['school_id']
  end

  def group_params

    params.require(:group)
        .permit(:name, :level_id, :school_id)
  end
end
