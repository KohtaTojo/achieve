class ConfirmMailer < ApplicationMailer
  def confirm_mail(tweet)
    @tweet = tweet

    mail to:"#{@tweet.user.email}", subject: "呟きの確認メール"
  end
end
