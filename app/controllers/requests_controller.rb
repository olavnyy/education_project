class RequestsController < ApplicationController
  skip_before_action :authenticate_request!, only: [:create]
  def create
    @request = Request.new(request_params)
      if @request.save
        # Tell the SrequestMailer to send a welcome email after save
        RequestMailer.request_email(@request).deliver_now
        render json: @request
        
      else
        render json: {
        content: 'invalid save'
        }
      end
  end

	private

	def request_params
	  params.require(:request).permit(:name, :address, :email, :contact_phone, 
	  																:admin_fname, :admin_lname, :admin_email, 
	  																:admin_contact_phone, :additionalinfo)
	end

end
