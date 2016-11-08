class AttendancesController < ApplicationController
  load_and_authorize_resource

  def index
    @attendances =  @current_user.class.attendances_list(@current_user)
    render json: @attendances
  end

  def show
    @attendance =  @current_user.class.attendances_list(@current_user).find(params[:id])
    if @attendance.nil?
      render json: {
          content: 'invalid show'
      }
    else
      render json: @attendance
    end
  end

  def create
    @attendance =  @current_user.class.attendances_list(@current_user).new(attendance_params)
    if @attendance.save
      render json: @attendance
    else
      render json: {
          content: 'invalid create'
      }
    end
  end

  def update
    @attendance =  @current_user.class.attendances_list(@current_user).find(params[:id])
    if @attendance.update_attributes(attendance_params)
      render json: @attendance
    else
      render json: {
          content: 'invalid update'
      }
    end
  end

  def destroy
    @current_user.class.attendances_list(@current_user).find(params[:id]).destroy
    render json: {
        content: 'deleted'
    }
  end

  private
  # , report_time_attributes: [:start, :end]
  def attendance_params
    params.require(:attendance)
        .permit(:time, :present, :student_id, :journal_id,
                report_times_attributes: [:start, :end])
  end
end
