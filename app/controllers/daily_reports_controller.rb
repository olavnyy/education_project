class DailyReportsController < ApplicationController
  load_and_authorize_resource
  before_action :set_daily_report, only: [:show, :update, :destroy]

  def index
    render_content(daily_reports_list)
  end

  def show
    render_content(@daily_report)
  end

  def update
    render_content(@daily_report.update_attributes(daily_report_params) ? {daily_report: @daily_report, status: true} : {errors: @daily_report.errors, status: false})
  end

  def destroy
    render_content({status: (@daily_report && @daily_report.destroy ? true : false)})
  end

  private

  def set_daily_report
    @daily_report = daily_reports_list.find_by(student_id: params[:student_id], day: server_day)
  end

  def daily_reports_list
    @current_user.type?('Teacher') ? @current_user.group.daily_report.where(day: server_day) : @current_user.daily_report
  end

  def daily_report_params
    params.require(:daily_report).permit(:day, :student_id, :group_id)
  end
end
