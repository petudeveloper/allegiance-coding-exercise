# Preview all emails at http://localhost:3000/rails/mailers/tech_request_mailer
class TechRequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tech_request_mailer/request_sent
  def request_sent
    TechRequestMailer.request_sent
  end

end
