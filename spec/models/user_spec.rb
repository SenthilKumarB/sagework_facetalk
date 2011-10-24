require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
            :username => "admin",
            :email => "senthil@sagework.com",
            :password => "admin",
            :password_confirmation => "admin",
            }
    @admin=User.create(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    @admin=User.create(@valid_attributes)
  end

  it "should allow valid username" do
    @admin.username = "admin"
    @admin.should have_at_least(0).error_on(:username)
  end

  it "should allow valid email" do
    @admin.email = "senthil@sagework.com"
    @admin.should have_at_least(0).error_on(:email)
  end

  it "should allow valid password" do
    @admin.password = "admin"
    @admin.should have_at_least(0).error_on(:password)
  end

  it "should allow valid password_confirmation" do
    @admin.password_confirmation = "admin"
    @admin.should have_at_least(0).error_on(:password_confirmation)
  end

  it "should not allow username that are less than 5 characters" do
    @admin.username = "sagework"
    @admin.should have_at_least(0).error_on(:username)
  end

  it "should not allow password that are less than 4 characters" do
    @admin.password = "sagework"
    @admin.should have_at_least(0).error_on(:password)
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