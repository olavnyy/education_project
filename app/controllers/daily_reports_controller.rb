class DailyReportsController < ApplicationController
  load_and_authorize_resource
  before_action :daily_reports_list
  before_action :set_daily_report, only: [:show, :update, :destroy]

  def index
    render_content(daily_reports_list.where(day: server_day))
  end

  def show
    render_content(@daily_report)
  end

  def update
    if params[:sended]
      daily_reports_list.each do |report|
        report.update_attributes(sended: true)
      end
    end
    render_content(@daily_report.update_attributes(daily_report_params) ? {daily_report: @daily_report, status: true} : {errors: @daily_report.errors, status: false})
  end

  def destroy
    render_content({status: (@daily_report && @daily_report.destroy ? true : false)})
  end

  private

  def set_daily_report
    if @current_user.type?('Teacher')
      @daily_report = daily_reports_list.find_by(student_id: params[:student_id], day: server_day)
    else
      @daily_report = DailyReport.find_by(student_id: params[:student_id], day: params[:day], sended: true)
    end
  end

  def daily_reports_list
    if @current_user.type?('Teacher')
      @current_user.group.daily_report
    else
      daily_reports = []
      @current_user.students.each do |student|
        daily_reports << student.daily_reports
      end
      daily_reports
    end
  end

  def daily_report_params
    params.require(:daily_report).permit(:day, :sended, :student_id, :group_id)
  end
end
