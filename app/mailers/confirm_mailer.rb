class ConfirmMailer < ApplicationMailer
  def confirm_mail(tweet)
    @tweet = tweet

    mail to:"#{@tweet.user.email}", subject: "お問い合わせの確認メール"
  end
end
