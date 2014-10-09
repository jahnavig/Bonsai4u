class AccountController < ApplicationController
	def index
	end
	def signup
	  @user = User.new
	  if request.post?
	  	@user = User.new(params[:user].permit(:name,:email,:hashed_password,:password))
	  	if @user.save
	  		UserNotifier.signup_user(@user).deliver
	  		redirect_to :action=>:login
	  		flash[:notice] ="User registered successfully"
	  	else
	  		flash[:notice] ="Invalid input"
	  		render :action=>:signup
	  	end
	  end
	end
	def login
		if request.post?
			@user=User.authenticate(params[:user][:email], params[:user][:password])
			if @user
				session[:user]=@user
				redirect_to :action=>:index
			else
				flash[:notice] = "Invalid email/password"
				render :action=>:login
			end
		end
	end
	def forget_password
		if request.post?
			@user=User.find_by_email(params[:user][:email])
			if @user
				new_password = random_password
				puts "++++ "
				puts new_password
				@user.update(:password => new_password)
				UserNotifier.send_random_password(@user).deliver

				flash[:notice]="New password sent to email"
				redirect_to :action=>:login
				
			else
				flash[:notice]="invalid email"
				render :action=>:forget_password
			end
		end
	end

	def random_password
		(0...8).map{65.+(rand(25)).chr}.join
	end
	def reset_password
		@user= User.find(session[:user])
		if request.post?
		if @user
			@user.update(:password=>params[:user][:password])
			UserNotifier.reset_password(@user).deliver

			flash[:notice] = "password has been changed"
			redirect_to :action=>:"index"
		else
			render :action=>:reset_password
		end
	end
	end

	def logout
		session[:user]=nil
		flash[:notice]="you have successfully logged out"
		end
end
