# Define Teachers controller
class TeachersController < ApplicationController
  load_and_authorize_resource
  before_action :set_teacher, only: [:show, :update, :destroy]

  def index
    render_content(teachers_list)
  end

  def show
    render_content(@teacher)
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.school_id = @current_user.school_id
    render_content(@teacher.save ? {teacher: @teacher, status: true} : {errors: @teacher.errors, status: false})
  end

  def update
    render_content(@teacher.update_attributes(teacher_update_params) ? {teacher: @teacher, status: true} : {errors: @teacher.errors, status: false})
  end

  def destroy
    render_content({status: (@teacher && @teacher.destroy ? true : false)})
  end

  private

  def set_teacher
    @teacher = teachers_list.find_by(id: params[:id])
  end

  def teachers_list
   @current_user.school.teachers if   @current_user.type?('Admin')
  end

  def teacher_params
    merge_params
    params
      .require(:teacher)
      .permit(:first_name, :last_name, :email, :contact_phone,
              :password, :password_confirmation, :school_id, :group_id)
  end

  def merge_params
    params[:teacher][:password] = params[:password]
    params[:teacher][:password_confirmation] = params[:password_confirmation]
  end

  def teacher_update_params
    params
      .require(:user)
      .permit(:first_name, :last_name, :email, :contact_phone,
              :school_id, :group_id)
  end

end
