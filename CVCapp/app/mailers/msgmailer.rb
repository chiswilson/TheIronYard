class Msgmailer < ActionMailer::Base
  default from: "service@commoneoncall.com"

  def send_the_email(to_addr, msg)
    @msg = msg
    mail(to: to_addr, subject: 'new msg')
  end
end
