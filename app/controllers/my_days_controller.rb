class MyDaysController < ApplicationController

  load_and_authorize_resource
  before_action :set_my_day, only: [:show, :update, :destroy]

  def index
    @my_days = MyDay.all
    render json: @my_days
  end

  def show
    render_content(@my_day)
    @photos = @my_day.photos
  end

  def create
    @my_day = MyDay.create(my_day_params)
    if params[:photos]
      @my_day.photos.create(parse_photos)
      render_content(@my_day ? {my_day: @my_day, status: true} : {errors: @my_day.errors, status: false})
    end
  end

  def update
    render_content(@my_day.update_attributes(my_day_params) ? {my_day: @my_day, status: true} : {errors: @my_day.errors, status: false})
  end

  def destroy
    render_content({status: (@my_day && @my_day.destroy ? true : false)})
  end

  private

  def my_day_params
    params.require(:my_day).permit(:description, :student_id, :daily_report_id)
  end

  def parse_photos
    params[:photos].map do |img|
      { image: decode_base64_image(img) }
    end
  end

end
