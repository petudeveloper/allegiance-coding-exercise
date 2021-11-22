class TechRequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.tech_request_mailer.request_sent.subject
  #
  def request_sent
    @greeting = "Hi"

    # Needs to find the current users email
    @user = User.find(2)

    mail(
      to: @user.email,
      subject: "new request created"
    )
  end
end
