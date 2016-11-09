class ApplicationMailer < ActionMailer::Base
  default from: ENV['PSRS_EMAIL']
  layout 'mailer'
end
