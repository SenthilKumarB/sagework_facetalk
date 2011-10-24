class UserController < ApplicationController
  before_filter :authenitcate_heroku
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:notice] = "Registered Successfully"
  		redirect_to home_path
  	else
  		flash[:error] = "Failed in registering user"
  		render :action => :new
  	end
  end

def provider_signin
    auth = request.env["omniauth.auth"]
    user_check = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    if user_check
      @user_session = UserSession.new(:username => auth["user_info"]["name"], :password => auth["uid"])
      @user_session.save    
    else
      user = User.new(:username => auth["user_info"]["name"], :email => auth["user_info"]["email"],
                      :password => auth["uid"], :password_confirmation => auth["uid"],
                      :provider => auth["provider"], :uid => auth["uid"], :nick_name => auth["user_info"]["nickname"])
      user.save(:validate => false)
    end
    flash[:notice] = "Login Successfully"
    redirect_to home_path
  end

end
