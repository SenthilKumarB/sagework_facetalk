require 'spec_helper'

describe "user/new.html.erb" do
  
  before(:each) do
    assign(:user, stub_model(User,
                             :username => "puggli",
                             :email => "sagunthala@sagework.com",
                             :password => "puggli",
                             :password_confirmation => "puggli"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    assert_select "form", :action => "create", :method => "post" do
      assert_select "input#user_username", :name => "user[username]"
      assert_select "input#user_password", :name => "user[password]"
      assert_select "input#user_password_confirmation", :name => "user[password_confirmation]"
      assert_select "input#user_email", :name => "user[email]"

    end
  end
end
