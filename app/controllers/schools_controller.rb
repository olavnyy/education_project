class SchoolsController < ApplicationController

  def show
    @school = School.find(params[:id])
    if @school.nil?
      render 'index'
    else
      render json: @school
    end
  end

  def new
    @school = School.new
    render json: @school
  end

   def index
    @schools = School.all
    render json: @schools
  end

  def create
    @school = School.new(school_params)
    if @school.save
      render json: @school
    else
      render 'new'
    end
  end

  def edit
    @school= School.find(params[:id])
    render json: @school
  end

  def destroy
    School.find(params[:id]).destroy
    render json: @school
  end

  def update
    @school = School.find(params[:id])
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