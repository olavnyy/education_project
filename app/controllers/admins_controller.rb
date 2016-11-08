# Define Admins controller
class AdminsController < ApplicationController
  load_and_authorize_resource

  def index
    render_content(Admin.all)
  end

  def show
    render_content(Admin.find(params[:id]))
  end

  def create
    render_content(@admin) if @admin = Admin.create(admin_params)
  end

  def update
    @admin = Admin.find(params[:id])
    render_content(@admin) if @admin.update_attributes(admin_params)
  end

  def destroy
    Admin.find(params[:id]).destroy
  end

  private

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
