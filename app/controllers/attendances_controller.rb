class AttendancesController < ApplicationController

  def index
    @attendances =  @current_user.class.attendance_list(@current_user)
    render json: @attendances
  end

  def show
    @attendance =  @current_user.class.attendance_list(@current_user).find(params[:id])
    if @attendance.nil?
      render json: {
          content: 'invalid show'
      }
    else
      render json: @attendance
    end
  end

  def create
    @attendance =  @current_user.class.attendance_list(@current_user).new(attendance_params)
    if @attendance.save
      render json: @attendance
    else
      render json: {
          content: 'invalid create'
      }
    end
  end

  def update
    @attendance =  @current_user.class.attendance_list(@current_user).find(params[:id])
    if @attendance.update_attributes(attendance_params)
      render json: @attendance
    else
      render json: {
          content: 'invalid update'
      }
    end
  end

  def destroy
    @current_user.class.attendance_list(@current_user).find(params[:id]).destroy
    render json: {
        content: 'deleted'
    }
  end

  def new
    @attendance =  @current_user.class.attendance_list(@current_user).new
    render json: @attendance
  end

  def edit
    @attendance =  @current_user.class.attendance_list(@current_user).find(params[:id])
    render json: @attendance
  end

  private

  def attendance_params
    params.require(:attendance).permit(:time, )
  end
end
