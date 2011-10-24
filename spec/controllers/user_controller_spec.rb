require 'spec_helper'

describe UserController do

  before(:each) do
    @valid_attributes = {
            :username => "puggli",
            :email => "sagunthala@sagework.com",
            :password => "puggli",
            :password_confirmation => "puggli",
            }
  end

  describe "GET 'new'" do
    it "should register new user" do
      get 'new'
    end
  end

  describe "POST 'create'" do
    it "should create a new instance given valid attributes" do
      post :create, :user => @valid_attributes
      flash[:notice].should == "Registered Successfully"
      response.should redirect_to home_path
    end

    it "should allow valid username" do
      admin = User.new :username => "puggli"
      admin.should have_at_least(0).error_on(:username)
    end

    it "should allow valid email" do
      admin = User.new :email => "sagunthala@sagework.com"
      admin.should have_at_least(0).error_on(:email)
    end

    it "should allow valid password" do
      admin = User.new :password => "puggli"
      admin.should have_at_least(0).error_on(:password)
    end

    it "should allow valid password_confirmation" do
      admin = User.new :password_confirmation => "puggli"
      admin.should have_at_least(0).error_on(:password_confirmation)
    end

    it "should not allow username that are less than 5 characters" do
      admin = User.new :username => "puggli"
      admin.should have_at_least(0).error_on(:username)
    end

    it "should not allow password that are less than 4 characters" do
      admin = User.new :password => "puggli"
      admin.should have_at_least(0).error_on(:password)
    end

    it "is not valid without a username" do
      admin = User.new :username => nil
      admin.should_not be_valid
    end

    it "is not valid without a email" do
      admin = User.new :email => nil
      admin.should_not be_valid
    end

    it "is not valid without a password" do
      admin = User.new :password => nil
      admin.should_not be_valid
    end

    it "is not valid without a password_confirmation" do
      admin = User.new :password_confirmation => nil
      admin.should_not be_valid
    end

  end

  context "when the User fails to save" do
    before(:each) do
      @user = User.create(:username => "admin", :email => "senthil@sagework.com", :password => "admin", :password_confirmation => "admin")
      @user.stub(:save).and_return(false)
    end
    it "renders the new template" do
      post :create
      flash[:error].should == "Failed in registering user"
      redirect_to :action => :new
    end
  end
end
