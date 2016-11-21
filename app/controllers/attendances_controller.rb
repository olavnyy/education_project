class AttendancesController < ApplicationController
  load_and_authorize_resource
  before_action :set_attendance, only: [:show, :update]
  before_action :all_attendances, only: [:index]

  def index
    render_content(@attendances)
  end

  def show
    render_content(@attendance)
  end

  def update
    update_time(params)
    render_content(@attendance)
  end

  private

  def set_attendance
    @attendance = attendances_list.find_by(id: params[:id])
  end

  def all_attendances
    @attendances = []
    @current_user.students.each do |student|
      @attendances << student.attendances.find_or_create_by(time: server_day, group: student.group)
    end
  end

  def update_time(params)
    puts 'hello'
    if params[:present] and exists_report_time(params[:id])
      @report_time = ReportTime.where(attendance_id: params[:id]).last
      @report_time[:end] = server_time if server_time > @report_time[:start]
      report_time_update[:end] = server_time
      @report_time.update_attributes(report_time_update)
    else
      @report_time = ReportTime.new
      @report_time.start = server_day
      @report_time.attendance_id = params[:id]
      @report_time.save
    end
    @attendance.update_attributes(present: params[:present])
  end

  # # report_time_update = {}
  # if params[:present] and exists_report_time(params[:id])
  #   @report_time = ReportTime.where(attendance_id: params[:id]).last
  #   @report_time[:end] = server_time if server_time > @report_time[:start]
  #   report_time_update[:end] = server_time
  #   @report_time.update_attributes(report_time_update)
  # else
  #   # @report_time = ReportTime.new
  #   # @report_time = {
  #   #     start: server_day,
  #   #     attendance_id: params[:id]
  #   # }
  #   # @report_time.save
  # end
  # @attendance.update_attributes(present: params[:present])

  def attendances_list
    @current_user.type?('Teacher') ? @current_user.group.attendances : @current_user.attendances
  end

  def exists_report_time(id)
    ReportTime.find_by(attendance_id: id)
  end

  def attendance_params
    params.require(:attendance)
        .permit(:time, :present, :student_id, :group_id, :daily_report_id,
                report_times: [:start, :end, :attendance_id])
  end
end

