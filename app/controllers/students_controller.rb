# Define Students controller
class StudentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_student, only: [:show, :update, :destroy]
  after_action :set_parents, only: [:create, :update]

  def index
    render_content(students_list)
  end

  def show
    render_content(@student)
  end

  def create
    @student = Student.new(student_params)
    add_avatar
    @student.school_id = @current_user.school_id
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

  def set_parents
    if params[:parents][:first]
      @parentFirstId = params[:parents][:first][:id]
      @parentFirst = Parent.find_by(id: @parentFirstId)
      @student.parents << @parentFirst
    end
    if params[:parents][:second]
      @parentSecondId = params[:parents][:second][:id]
      @parentSecond = Parent.find_by(id: @parentSecondId)
      @student.parents << @parentSecond
    end
  end

  def student_params
    params
      .require(:student)
      .permit(:first_name, :last_name, :group_id, :school_id, :age, :avatar)
  end
end
