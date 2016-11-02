# Define Admins controller
class AdminsController < ApplicationController
  load_and_authorize_resource

  def index
    @admins = Admin.all
    render json: @admins
  end

  def show
    @admin = Admin.find(params[:id])
    if @admin.nil?
      render json: {
        content: 'invalid show'
      }
    else
      render json: @admin
    end
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      render json: @admin
    else
      render 'new'
    end
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      render json: @admin
    else
      render json: {
        content: 'invalid update'
      }
    end
  end

  def destroy
    Admin.find(params[:id]).destroy
    render json: {
      content: 'deleted'
    }
  end

  private

  def admin_params
    params
      .require(:admin)
      .permit(:first_name, :last_name, :email, :school_id,
              :contact_phone, :password, :password_confirmation)
    end
end
