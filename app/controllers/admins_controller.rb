# Define Admins controller
class AdminsController < ApplicationController
  load_and_authorize_resource
  before_action :set_admin, only: [:show, :update, :destroy]

  def index
    render_content(Admin.all)
  end

  def show
    render_content(@admin))
  end

  def create
    @admin = Admin.new(admin_params)
    render_content(@admin.save ? {admin: @admin, status: true} : {errors: @admin.errors, status: false})
  end

  def update
    render_content(@admin.update_attributes(admin_params) ? {admin: @admin, status: true} : {errors: @admin.errors, status: false})
  end

  def destroy
    render_content({status: (@admin && @admin.destroy ? true : false)})
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    merge_params
    params
      .require(:admin)
      .permit(:first_name, :last_name, :email, :school_id, :contact_phone,
              :password, :password_confirmation)
  end

  def merge_params
    params[:admin][:password] = params[:password]
    params[:admin][:password_confirmation] = params[:password_confirmation]
  end
end
