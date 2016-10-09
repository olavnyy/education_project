# Define Teachers controller
class TeachersController < ApplicationController
  def show
    @teacher = Teacher.find(params[:id])
    if @teacher.nill?
      render 'teachers#index'
    else
      render json: @teacher
    end
  end

  def new
    @teacher = Teacher.new
    render json: @teacher
  end

  def index
    @teacher = Teacher.all
    render json: @teacher
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher
    else
      render 'teachers#new'
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
    render json: @teacher
  end

  def destroy
    Teacher.find(params[:id]).destroy
    render json: @teacher
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(teacher_params)
      render json: @teacher
    else
      render 'teachers#edit'
    end
  end

  private

  def teacher_params
    params
      .require(:teacher)
      .permit(:first_name, :last_name, :group_id, :email,
              :contact_phone, :password, :password_confirmation)
      .merge(school_id: current_user.school_id)
  end
end
