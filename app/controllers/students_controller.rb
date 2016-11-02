# Define Students controller
class StudentsController < ApplicationController
  def index
    @students = @current_user.class.students_list(@current_user)
    render json: @students
  end

  def show
    @student = @current_user.class.students_list(@current_user).find(params[:id])
    if @student.nil?
      render json: {
        content: 'invalid show'
      }
    else
      render json: @student
    end
  end

  def create
    @student = @current_user.class.students_list(@current_user).new(student_params)
    if @student.save
      render json: @student
    else
      render json: {
        content: 'invalid create'
      }
    end
  end

  def update
    @student = @current_user.class.students_list(@current_user).find(params[:id])
    if @student.update_attributes(student_params)
      render json: @student
    else
      render json: {
        content: 'invalid update'
      }
    end
  end

  def destroy
    @current_user.class.students_list(@current_user).find(params[:id]).destroy
    render json: {
      content: 'deleted'
    }
  end

  private

  def student_params
    params
      .require(:student)
      .permit(:first_name, :last_name, :group_id, :school_id, :age)

  end
end
