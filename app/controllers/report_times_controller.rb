class ReportTimesController < ApplicationController
  def index
    @report_times = ReportTime.all
    render json: @report_times
  end

  def show
    @report_time = ReportTime.find(params[:id])
    if @report_time.nil?
      render json: {
          content: 'invalid show'
      }
    else
      render json: @report_time
    end
  end

  def create
    @report_time = ReportTime.new(report_time_params)
    if @report_time.save
      render json: @report_time
    else
      render json: {
          content: 'invalid create'
      }
    end
  end

  def update
    @report_time = ReportTime.find(params[:id])
    if @report_time.update_attributes(report_time_params)
      render json: @report_time
    else
      render json: {
          content: 'invalid update'
      }
    end
  end

  def destroy
    ReportTime.find(params[:id]).destroy
    render json: {
        content: 'deleted'
    }
  end

  private

  def report_time_params
    params
        .require(:report_times)
        .permit(:start, :end, :attendance_id)
  end
end
