class OurDaysController < ApplicationController

  # load_and_authorize_resource
  # before_action :set_our_day, only: [:show, :update, :destroy]

  def index
    # render_content(my_day_list)
  end

  def show
    render_content(@our_day)
    @photos = @our_day.photos
  end

  def create
    @our_day = OurDay.create(our_day_params)
    if params[:photos]
      @our_day.photos.create(parse_photos)
      render_content(@our_day ? {our_day: @our_day, status: true} : {errors: @our_day.errors, status: false})
    end
  end

  def update
    render_content(@our_day.update_attributes(our_day_params) ? {our_day: @our_day, status: true} : {errors: @our_day.errors, status: false})
  end

  def destroy
    render_content({status: (@our_day && @our_day.destroy ? true : false)})
  end

  private

  def my_day_params
    params.require(:our_day).permit(:description, :group_id, :daily_report_id)
  end

  def parse_photos
    params[:photos].map do |img|
      { image: decode_base64_image(img) }
    end
  end

end
