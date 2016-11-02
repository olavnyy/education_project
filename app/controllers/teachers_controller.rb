# Define Teachers controller
class TeachersController < ApplicationController
  def show
    @teacher = @current_user.class.teachers_list(@current_user).find(params[:id])
    render json: @teacher
  end

  def index
    @teacher = @current_user.class.teachers_list(@current_user)
    render json: @teacher
  end

  def create
    @teacher = @current_user.class.teachers_list(@current_user).new(teacher_params)
    if @teacher.save
      redirect_to @teacher
    else
      render json: {
        content: 'invalid create'
      }
    end
  end

  def destroy
    @current_user.class.teachers_list(@current_user).find(params[:id]).destroy
    render json: {
      content: 'deleted'
    }
  end

  def update
    @teacher = @current_user.class.teachers_list(@current_user).find(params[:id])
    if @teacher.update_attributes(teacher_params)
      render json: @teacher
    else
      render json: {
        content: 'invalid update'
      }
    end
  end

  private

  def teacher_params
    params
      .require(:teacher)
      .permit(:first_name, :last_name, :group_id, :email,
              :contact_phone, :password, :password_confirmation, :school_id)
  end
end
