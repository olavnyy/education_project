# Define Students controller
class StudentsController < ApplicationController
  load_and_authorize_resource

  def index
    render_content(current_student(@current_user))
  end

  def show
    render_content(current_student(@current_user).find(params[:id]))
  end

  def create
    @student = current_student(@current_user).new(student_params)
    add_avatar(@student)
    render_content(@student) if @student.save
  end

  def update
    @student = current_student(@current_user).find(params[:id])
    add_avatar(@student)
    render_content(@student) if @student.update_attributes(student_params)
  end

  def destroy
    current_student(@current_user).find(params[:id]).destroy
  end

  private

  def current_student(user)
    student = @current_user.class.students_list(user)
  end

  def add_avatar(student)
    student.avatar = decode_base64_image(params[:avatar]) if params[:avatar]
  end

  def student_params
    params
      .require(:student)
      .permit(:id, :first_name, :last_name, :group_id, :school_id, :age, :avatar)
  end
end
