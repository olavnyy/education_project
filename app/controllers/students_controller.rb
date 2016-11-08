# Define Students controller
class StudentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_student, only: [:show, :update, :destroy]

  def index
    render_content(students_list)
  end

  def show
    render_content(@student)
  end

  def create
    @student = Student.new(student_params)
    add_avatar
    render_content(@student.save ? {student: @student, status: true} : {errors: @student.errors, status: false})
  end

  def update
    add_avatar
    render_content(@student.update_attributes(student_params) ? {student: @student, status: true} : {errors: @student.errors, status: false})
  end

  def destroy
    render_content({status: (@student && @student.destroy ? true : false)})
  end

  private

  def set_student
    @student = students_list.find_by(id: params[:id])
  end

  def students_list
    @current_user.type?('Admin') ? @current_user.school.students : @current_user.students
  end

  def add_avatar
    @student.avatar = decode_base64_image(params[:avatar]) if params[:avatar] && @student
  end

  def student_params
    params
      .require(:student)
      .permit(:id, :first_name, :last_name, :group_id, :school_id, :age, :avatar)
  end
end


# # Define Students controller
# class StudentsController < ApplicationController
#   load_and_authorize_resource
#
#   def index
#     render_content(current_student(@current_user))
#   end
#
#   def show
#     render_content(current_student(@current_user).find(params[:id]))
#   end
#
#   def create
#     @student = current_student(@current_user).new(student_params)
#     add_avatar(@student)
#     render_content(@student) if @student.save
#   end
#
#   def update
#     @student = current_student(@current_user).find(params[:id])
#     add_avatar(@student)
#     render_content(@student) if @student.update_attributes(student_params)
#   end
#
#   def destroy
#     current_student(@current_user).find(params[:id]).destroy
#   end
#
#   private
#
#   def current_student(user)
#     student = @current_user.class.students_list(user)
#   end
#
#   def add_avatar(student)
#     student.avatar = decode_base64_image(params[:avatar]) if params[:avatar]
#   end
#
#   def student_params
#     params
#       .require(:student)
#       .permit(:id, :first_name, :last_name, :group_id, :school_id, :age, :avatar)
#   end
# end
