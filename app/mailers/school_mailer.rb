class SchoolMailer < ApplicationMailer
  default from: 'psrsui197ruby@gmail.com'
 
	def school_email(school)
      @school = school
      mail(to: @school.email, subject: "Welcome to PSRS")
	end
end
