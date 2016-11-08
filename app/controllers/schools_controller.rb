# Define Schools controller
class SchoolsController < ApplicationController
  load_and_authorize_resource
  before_action :set_school, only: [:show, :update, :destroy]

  def index
    render_content(School.all)
  end

  def show
    render_content(@school)
  end

  def create
    @school = School.new(school_params)
    SchoolMailer.school_email(@school).deliver_now
    render_content(@school.save ? {admin: @admin, status: true} : {errors: @admin.errors, status: false})
  end

  def update
    render_content(@school.update_attributes(school_params) ? {school: @school, status: true} : {errors: @school.errors, status: false})
  end

  def destroy
    render_content({status: (@school && @school.destroy ? true : false)})
  end


  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :email, :address, :contact_phone)
  end

end
