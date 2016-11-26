class ParentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_parent, only: [:show, :update, :destroy]

  def index
    render_content(parents_list)
  end

  def show
    render_content(@parent)
  end

  def create
    @parent = Parent.new(parent_params)
    add_avatar
    @parent.school_id = @current_user.school_id
    render_content(@parent.save ? {parent: @parent, status: true} : {errors: @parent.errors, status: false})
    ParentMailer.parent_email(@parent).deliver_later
  end

  def update
    add_avatar
    render_content(@parent.update_attributes(parent_update_params) ? {parent: @parent, status: true} : {errors: @parent.errors, status: false})
  end

  def destroy
    render_content({status: (@parent && @parent.destroy ? true : false)})
  end

  private

  def add_avatar
    @parent.avatar = decode_base64_image(params[:avatar]) if params[:avatar] && @parent
  end

  def set_parent
    @parent = parents_list.find_by(id: params[:id])
  end

  def parents_list
    @current_user.type?('Admin') ? @current_user.school.parents : @current_user.students.parents
  end

  def parent_params
    merge_params
    params
      .require(:parent)
      .permit(:first_name, :last_name, :email, :contact_phone,
              :password, :password_confirmation, :school_id, :avatar)
  end

  def merge_params
    params[:parent][:password] = params[:password]
    params[:parent][:password_confirmation] = params[:password_confirmation]
  end

  def parent_update_params
    params
      .require(:user)
      .permit(:first_name, :last_name, :email, :contact_phone,
              :school_id, :avatar)
  end

end
