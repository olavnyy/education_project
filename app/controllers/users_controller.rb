class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    if @user.nil?
      render json: {
        content: 'invalid show'
      }
    else
      render json: @user
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: {
        content: 'invalid create'
      }
    end
  end

  def update
    @user = User.find(params[:id])
    @user.avatar = decode_base64_image(params[:avatar]) if params[:avatar]
    if @user.update_attributes(user_params)
      render json: @user
    else
      render json: {
        content: 'invalid update'
      }
    end
  end

  def destroy
    User.find(params[:id]).destroy
    render json: {
      content: 'deleted'
    }
  end

  private

  def user_params
    params
      .require(:user)
      .permit(:first_name, :last_name, :email, :contact_phone, :password,
              :password_confirmation, :avatar)
  end
end
