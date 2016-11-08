class AttendancesController < ApplicationController
  load_and_authorize_resource
  before_action :set_attendance, only: [:show, :update, :destroy]
  def index
    render_content(attendances_list)
    render_content({server_time: Time.now.utc})
  end

  def show
    render_content(@attendance)
  end

  def create
    @attendance = Attendance.new(attendance_params)
    render_content(@attendance.save ? {attendance: @attendance, status: true} : {errors: @attendance.errors, status: false})
  end

  def update
    render_content(@attendance.update_attributes(attendance_params) ? {level: @attendance, status: true} : {errors: @attendance.errors, status: false})
  end

  def destroy
    render_content({status: (@attendance && @attendance.destroy ? true : false)})
  end

  private

  def set_attendance
    @attendance = attendances_list.find_by(id: params[:id])
  end

  def attendances_list
    @current_user.type?('Teacher') ? @current_user.group.journal.attendances : @current_user.attendances
  end

  def attendance_params
    params.require(:attendance)
        .permit(:time, :present, :student_id, :journal_id,
                report_times_attributes: [:start, :end])
  end
end
