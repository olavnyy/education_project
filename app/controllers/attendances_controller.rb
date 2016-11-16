class AttendancesController < ApplicationController
  load_and_authorize_resource
  before_action :set_attendance, only: [:show, :update]
  before_action :set_attendances, only: [:index]

  def index
    @attendances
  end

  def show
    render_content(@attendance)
  end

  def update
    if check_for_report_times(params[:id])
      @report_time = ReportTime.where(attendance_id: params[:id]).last
    else
      @report_time = ReportTime.new
    end
    if @report_time.start and !@report_time.end and (server_time > @report_time.start)
      report_time_update = {
          end: server_time
      }
      @report_time.update_attributes(report_time_update)
    elsif (@report_time.start and @report_time.end) or (!@report_time.start and !@report_time.end)
      @report_time = ReportTime.new
      @report_time.start = server_time
      @report_time.attendance_id = params[:id]
      @report_time.save
    end
    attendance_params_update = {
        present:  attendance_params[:present]
    }

    render_content(@attendance.update_attributes(attendance_params_update) ? {attendance: @attendance, status: true} : {errors: @attendance.errors, status: false})
  end

  private

  def set_attendance
    @attendance = attendances_list.find_by(id: params[:id])
  end

  def set_attendances
    @attendances = []
    @current_user.students.each do |student|
      @attendances << student.attendances.find_or_create_by(time: server_day, group: student.group)
    end
  end

  def attendances_list
    @current_user.type?('Teacher') ? @current_user.group.attendances : @current_user.attendances
  end

  def check_for_report_times(id)
    ReportTime.find_by(attendance_id: id)
  end

  def server_day
    t = Time.now
    t.strftime("%Y-%m-%d")
  end

  def server_time
    t = Time.now
    t.strftime("%H:%M:%S")
  end

  def attendance_params
    params.require(:attendance)
        .permit(:time, :present, :student_id, :group_id, :daily_report_id,
                report_times: [:start, :end, :attendance_id])
  end
end

