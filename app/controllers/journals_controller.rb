class JournalsController < ApplicationController
  load_and_authorize_resource
  before_action :set_journal, only: [:show, :update, :destroy]
  after_create :create_attendances

  def index
    render_content(journals_list)
  end

  def show
    render_content(@journal)
  end

  def create
    @journal = Journal.new(journal_params)
    render_content(@journal.save ? {journal: @journal, status: true}: {errors: @level.errors, status: false})
  end

  def update
    render_content(@journal.update_attributes(journal_params) ? {journal: @journal, status: true} : {errors: @journal.errors, status: false})
  end

  def destroy
    render_content({status: (@journal && @journal.destroy ? true : false)})
  end

  private

  def create_attendances
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

  def set_journal
    @journal = journals_list.fing_by(id: params[:id])
  end

  def journals_list
    @current_user.type?('Teacher') ? @current_user.group.journal : @current_user.journal
  end

  def journal_params
    params.require(:journal).permit(:title)
  end
end
