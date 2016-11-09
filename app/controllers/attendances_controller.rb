class AttendancesController < ApplicationController
  load_and_authorize_resource
  before_action :set_attendance, only: [:show, :update, :destroy]
  def index
    render_content(attendances_list)
  end

  def show
    render_content(@attendance)
  end

  def create
    if chechForExistance
      render_content(needToSave)
    else
      @current_user.group.students.each do |stud|
        @attendance = Attendance.new
        @attendance.present = false
        @attendance.time = server_day
        @attendance.student_id = stud.id
        @attendance.journal_id = @current_user.group.journal.id
        @attendance.save
      end
      render_content(needToSave)
    end
  end

  def update
    # if @attendance.report_times
    #
    # else
    attendance_params_update = {
        present:  attendance_params['present']
        report_times: {
          start: "10:08"
          end: "15:30"
        }
    }
    # end
    render_content(@attendance.update_attributes(attendance_params_update) ? {attendance: @attendance, status: true} : {errors: @attendance.errors, status: false})
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

  def server_day
    t = Time.now
    t.strftime("%Y-%m-%d")
  end

  def server_time
    t = Time.now
    t.strftime("%H:%M:%S")
  end

  def chechForExistance
    attendances_list.find_by(time: server_day)
  end

  def needToSave
    attendances_list.where(time: server_day)
  end

  def attendance_params
    params.require(:attendance)
        .permit(:time, :present, :student_id, :journal_id,
                report_times: [:start, :end])
  end
end
