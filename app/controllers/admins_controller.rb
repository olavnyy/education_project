# Define Admins controller
class AdminsController < ApplicationController
  load_and_authorize_resource
  before_action :set_admin, only: [:show, :update, :destroy]

  def index
    render_content(Admin.all)
  end

  def show
    render_content(@admin)
  end

  def create
    render_content(@admin) if @admin = Admin.create(admin_params)
  end

  def update
    render_content(@admin.update_attributes(admin_update_params) ? {admin: @admin, status: true} : {errors: @admin.errors, status: false})
  end

  def destroy
    Admin.find(params[:id]).destroy
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

  def admin_update_params
    params
      .require(:user)
      .permit(:first_name, :last_name, :email, :school_id, :contact_phone)
  end
  def merge_params
    params[:admin][:password] = params[:password]
    params[:admin][:password_confirmation] = params[:password_confirmation]
  end
end
