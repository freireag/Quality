class NotificationMailer < ActionMailer::Base
  def payment_email(student)
    recipients  student.email
    from        "thiago@freireag.com"
    subject     "Aviso de pagamento"
    body        :student => student
  end
end
