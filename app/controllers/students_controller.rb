# Define Students controller
class StudentsController < ApplicationController
  def index
    @students = Student.all
    render json: @students
  end

  def show
    @student = Student.find(params[:id])
    if @student.nil?
      render json: {
        content: 'invalid show'
      }
    else
      render json: @student
    end
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      render json: @student
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      render json: @student
    else
      render json: {
        content: 'invalid update'
      }
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    render json: {
      content: 'deleted'
    }
  end

  private

  def student_params
    params
      .require(:student)
      .permit(:first_name, :last_name, :group_id, :age)
      .merge(school_id: current_user.school_id)
  end
end
