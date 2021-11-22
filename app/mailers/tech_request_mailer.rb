class TechRequestMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.tech_request_mailer.request_sent.subject
  #
  def request_sent
    @user = params[:user]
    @request = params[:request]
    @message = @request.body
    @admi_user = User.find_by(admin: true)

    mail(
      to: @admi_user.email,
      from: @user.email,
      subject: @request.subject
    )
  end
end
