class RequestMailer < ApplicationMailer
default from: 'kuriy.yevgeniy@gmail.com'
 
	def request_email(request)
      @request = request
      mail(to: "psrsui197@gmail.com", subject: "Register me")
	end
end