class OrderMailer < ApplicationMailer
  
  def payment_confirmation(user)
    @user = user

    mail to: user.email, subject: "Payment Confirmation"
  end
end
