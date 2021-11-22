class TechRequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.tech_request_mailer.request_sent.subject
  #
  def request_sent
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
