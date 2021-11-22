class ApplicationMailer < ActionMailer::Base
  @user = User.find_by(admin: true)
  default from: @user.email
  layout 'mailer'
end
