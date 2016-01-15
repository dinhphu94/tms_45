class UserMailer < ApplicationMailer
  def password_reset user
    @user = user
    mail to: user.email, subject: default_i18n_subject
  end
end
