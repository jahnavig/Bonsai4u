
class UserNotifier < ActionMailer::Base
  default from: "janavig@gmail.com"

  def signup_user(user)
  	@user=user
  	mail(:to=>@user.email, :subject=>"Welcome to bonsai4u")
   end
   def send_random_password(user)
   	@user= user
   	mail(:to=>@user.email, :subject=>"New password for Bonsai4u")
   end

   def reset_password(user)
   	@user = user
   	mail(:to=> @user.email, :subject=>"password has been changed")
end


