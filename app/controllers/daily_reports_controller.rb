class DailyReportsController < ApplicationController
  load_and_authorize_resource
  before_action :set_daily_report, only: [:show, :update, :destroy]
  after_action :create_attendances, only: [:create]

  def index
    render_content(daily_reports_list)
  end

  def show
    render_content(@daily_report)
  end

  def create
    create_daily_reports
      # @daily_report = DailyReport.new(daily_report_params)
      # @daily_report.day = server_utc
      # render_content(@daily_report.save ? {daily_report: @daily_report, status: true}: {errors: @daily_report.errors, status: false})
  end

  def update
    render_content(@daily_report.update_attributes(daily_report_params) ? {daily_report: @daily_report, status: true} : {errors: @daily_report.errors, status: false})
  end

  def destroy
    render_content({status: (@daily_report && @daily_report.destroy ? true : false)})
  end

  private

  def set_daily_report
    @daily_report = daily_reports_list.fing_by(id: params[:id])
  end

  def daily_reports_list
    @current_user.type?('Teacher') ? @current_user.group.daily_report : @current_user.daily_report
  end

  def attendances_list
    @current_user.type?('Teacher') ? @current_user.group.attendances : @current_user.attendances
  end


  def create_daily_reports
    if !check_existance_dailyreport
      @current_user.group.students.each do |stud|
        @daily_report = DailyReport.new
        @daily_report.student_id = stud.id
        @daily_report.day = server_time
        @daily_report.group_id = @current_user.group.id
        @daily_report.save
      end
    end
  end

  def create_attendances
    if !check_existance_attendances
      @current_user.group.students.each do |stud|
        @attendance = Attendance.new
        @attendance.present = false
        @attendance.student_id = stud.id
        @attendance.group_id = @current_user.group.id
        @attendance.time = server_time
        daily_rep = get_daily_report_for_attendance
        @attendance.daily_report_id = daily_rep.id
        @attendance.save
      end
    end
  end

  # while creating attendances we need connect to daily report
  # then find by student
  def get_daily_report_for_attendance
    daily_reports_list.find_by_student_id_and_day(@attendance.student_id, server_time)
  end

  # check if we need to create attendances or return it
  def check_existance_attendances
    attendances_list.find_by(time: server_time)
  end

  # check if we need to create dailyreports or return it
  def check_existance_dailyreport
    daily_reports_list.find_by(day: server_time)
  end

  def server_time
    t = Time.now
    t.strftime("%Y-%m-%d")
  end

  def server_utc
    Time.now.utc
  end

  def daily_report_params
    params.require(:daily_report).permit(:day, :student_id, :group_id)
  end
end
