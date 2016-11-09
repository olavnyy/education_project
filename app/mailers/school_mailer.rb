class SchoolMailer < ApplicationMailer
  default from: ENV['PSRS_EMAIL']
 
	def school_email(school)
      @school = school
      mail(to: @school.email, subject: "Welcome to PSRS")
	end
end
