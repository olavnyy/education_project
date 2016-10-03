class SchoolsController < ApplicationController

  def show
    @school = School.find(school_params)
    render json: @school
  end

  def new
    @school = School.new
    render json: @school
  end

   def index
    @schools = School.all
    render json: @school
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to @school
    else
      render 'students#new'
    end
  end

  def edit
    @school= School.find(school_params)
    render json: @school
  end

  def destroy
    School.find(school_params).destroy
    render json: @school
  end

  def update
    @school = School.find(school_params)
    if @school.update_attributes(school_params)
     render json: @school

    # Handle a successful update.
    else
      render 'schools#edit'
    end
  end

  private

  def school_params
    params.
      require(:school).
      permit(:name, :email, :address, :contact_phone)
  end

end