class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]

  def index
    render_content(User.all)
  end

  def show
    render_content(@user)
  end

  def create
    @user = User.new(user_params)
    render_content(@user.save ? {user: @user, status: true} : {errors: @user.errors, status: false})
  end

  def update
    @user.avatar = decode_base64_image(params[:avatar]) if params[:avatar]
    render_content(@user.update_attributes(user_update_params) ? (@user) : {errors: @user.errors, status: false})
  end

  def destroy
    render_content({status: (@user && @user.destroy ? true : false)})
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params
      .require(:user)
      .permit(:first_name, :last_name, :email, :contact_phone, :password,
              :password_confirmation, :avatar)
  end

  def user_update_params
    params
      .require(:user)
      .permit(:first_name, :last_name, :email, :contact_phone, :avatar)
  end
end
