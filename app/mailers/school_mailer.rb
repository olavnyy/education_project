class SchoolMailer < ApplicationMailer
  default from: 'kuriy.yevgeniy@gmail.com'
 
	def school_email(school)
      @school = school
      mail(to: @school.email, subject: "Welcome to PSRS")
	end
end
