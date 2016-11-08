class JournalsController < ApplicationController
  load_and_authorize_resource
  before_action :set_journal, only: [:show, :update, :destroy]

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
