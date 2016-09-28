class SchoolController < ApplicationController

  def show
    @school = School.find(params[:id])
    render json: @school
  end

  def new
    @school = School.new
    render json: @school
  end

   def index
    @school = School.all
    render json: @school
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to @school
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

    # Handle a successful update.
    else
      render 'edit'
    end

  end
end