class OurDaysController < ApplicationController

  load_and_authorize_resource
  before_action :our_days_list, only: [:index, :update]
  before_action :set_our_day, only: [:show, :update, :destroy]

  def index
    render_content(@our_days)
  end

  def show
    render_content(@our_day)
    @photos = @our_day.photos
  end

  def update
    render_content(@our_day.update_attributes(our_day_params) ? {our_day: @our_day, status: true} : {errors: @my_day.errors, status: false})
    @our_day.photos.create(parse_photos)
    # @our_days.each do |i|
    #   i.update_attributes(our_day_params)
    #   i.photos.create(parse_photos)
    # end
  end

  def destroy
    render_content({status: (@our_day && @our_day.destroy ? true : false)})
  end

  private

    def our_day_params
      params.require(:our_day).permit(:description, :day)
    end

    def our_days_list
      if @current_user.type?('Teacher')
        @our_days = @current_user.group.our_days.where(day: server_day)
      end
    end

    def set_our_day
      @our_day = OurDay.find(params[:id])
    end

    def parse_photos
      params[:photos].map do |img|
       { image: decode_base64_image(img) }
      end
    end

end
