class TeacherMailer < ApplicationMailer
 	default from: ENV['PSRS_EMAIL']
 	def teacher_email(teacher)
      @teacher = teacher
      mail(to: @teacher.email, subject: "Welcome to PSRS")
	end
end