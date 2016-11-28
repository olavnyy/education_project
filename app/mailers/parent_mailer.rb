class ParentMailer < ApplicationMailer
	default from: ENV['PSRS_EMAIL']
 	def parent_email(parent)
      @parent = parent
      mail(to: @parent.email, subject: "Welcome to PSRS")
	end
end