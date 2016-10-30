class SchoolsController < ApplicationController
  load_and_authorize_resource

  def show
    @school = @current_user.class.schools_list(@current_user).find(params[:id])
    if @school.nil?
      render 'index'
    else
      render json: @school
    end
  end

  # def new
  #   @school = @current_user.class.schools_list(@current_user).new(school_params)
  #   render json: @school
  # end

   def index
    @schools = @current_user.class.schools_list(@current_user)
    render json: @schools
  end

  def create
    @school = @current_user.class.schools_list(@current_user).new(school_params)
    if @school.save
      render json: @school
    else
      render 'new'
    end
  end

  # def edit
  #   @school= @current_user.class.schools_list(@current_user).find(params[:id])
  #   render json: @school
  # end

  def destroy
    @current_user.class.schools_list(@current_user).find(params[:id]).destroy
    render json: @school
  end

  def update
    @school = @current_user.class.schools_list(@current_user).find(params[:id])
    if @school.update_attributes(school_params)
      render json: @school
    else
      render 'edit'
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :email, :address, :contact_phone)
  end

end
