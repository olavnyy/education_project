class OurDaysController < ApplicationController

  load_and_authorize_resource
  before_action :our_days_list, only: [:index]
  before_action :set_our_day, only: [:show, :update, :destroy]

  def index
    render_content(@our_days)
  end

  def show
    render_content(@our_day)
    @photos = @our_day.photos
  end

  # def create
  #   @my_day = MyDay.create(my_day_params)
  #   if params[:photos]
  #     @my_day.photos.create(parse_photos)
  #     render_content(@my_day ? {my_day: @my_day, status: true} : {errors: @my_day.errors, status: false})
  #   end
  # end

  def update
    render_content(@our_day.update_attributes(our_day_params) ? {our_day: @our_day, status: true} : {errors: @our_day.errors, status: false})
    @our_day.photos.create(parse_photos)
  end

  def destroy
    render_content({status: (@our_day && @our_day.destroy ? true : false)})
  end

  # def my_days_list
  #   @current_user.type?('Teacher') ? @current_user.group.studentsattendances : @current_user.attendances
  # end


  private

  def our_day_params
    params.require(:our_day).permit(:description, :group_id, :daily_report_id, :day)
  end

  def our_days_list
    if @current_user.type?('Teacher')
      @current_user.group.our_days(day: server_day)
    end
  end

  def set_our_day
    @my_day = OurDay.find(params[:id])
  end

  # def current_my_day
  #   MyDay.where(my_date: server_day)
  # end

  def parse_photos
    params[:photos].map do |img|
      { image: decode_base64_image(img) }
    end
  end

end
