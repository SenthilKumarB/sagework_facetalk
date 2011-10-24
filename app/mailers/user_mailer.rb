class UserMailer < ActionMailer::Base
  default :from => "senthilexample@gmail.com"
  def invite_friend(user)
    mail(:to => user , :subject => "Invite Friends")
  end
end
