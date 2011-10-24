class FriendsController < ApplicationController
  before_filter :require_user
  before_filter :authenitcate_heroku
  def index
  	if (params[:contact] == "true" && !session[:contact].blank?)
		  @contact = session[:contact]
	  else
  		@contact = nil
  		session[:contact] = nil
  	end
  end

  def get_contacts
  	unless (params[:client] == "facebook")
  		begin
			contact = Contacts.new(params[:client], params[:name], params[:password]).contacts
		rescue
			flash[:notice] = "Failed in Inviting Failed Check username/password"
			session[:contact] = nil
		else
			session[:contact] = contact
		end
	else
		#TODO FACEBOOK integration
    	  # fb_user = FbGraph::User.fetch facebook.uid #, :access_token => facebook.token
    	 # render :text => fb_user
	 end	
	 redirect_to :action =>:index, :contact=>'true'
  end

  def email_invited_friends
  	emails = params[:email]
  	emails.each do |email|
		  UserMailer.invite_friend(email).deliver
    end
  	flash[:notice] = "Mail Sent successfully"
  	redirect_to :action => :index
  end

  def broadcast
    @live_user = User.all
    if params[:id]
      user = User.find_by_id(params[:id])
    else
      user = current_user
    end
    if user == current_user
      render :action => "broadcast"
    else
      render :action => "receive"
    end
  end

  def show
    if params[:id]
      user = User.find_by_id(params[:id])
    else
      user = current_user
    end
  	render :xml => user 
  end
end
