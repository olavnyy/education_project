class StudentsController < ApplicationController

   def show
    @student = Student.find(params[:id])
    render json: @student
  end

  def new
    @student = Student.new
    render json: @student
  end

   def index
    @student = Student.all
    render json: @student
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'students#new'
    end
  end

  def edit
    @student= Student.find(params[:id])
    render json: @student
  end

  def destroy
    Student.find(params[:id]).destroy
    render json: @student
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
     render json: @student

    # Handle a successful update.
    else
      render 'students#edit'
    end
  end

  private

  def student_params
    params.
      require(:student).
      permit(:first_name, :last_name, :group_id, :age).
      merge(school_id: current_user.school_id)
  end

end
