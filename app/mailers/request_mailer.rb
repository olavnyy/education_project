class RequestMailer < ApplicationMailer
  	default from: ENV['APP_EMAIL']
 	def request_email(request)
      @request = request
      mail(to: ENV['PSRS_EMAIL'], subject: "Register me")
	end
end