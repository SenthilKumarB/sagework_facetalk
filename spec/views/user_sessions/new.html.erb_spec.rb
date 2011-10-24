require 'spec_helper'
describe "user_sessions/new.html.erb" do
  fixtures :users
  before(:each) do
    assign(:user_session, stub_model(User,
                             :username => users(:one).username,
                             :password => users(:one).password,
                             :remember_me => 1

    ).as_new_record)
  end

  it "renders new user form" do
    render

    rendered.should have_selector("h1") do |h1|
     h1.first.text.should == "User Login"
    end

    assert_select "form", :action => "create", :method => "post" do
      assert_select "input#user_username", :name => "user[username]"
      assert_select "input#user_password", :name => "user[password]"
      assert_select "input#user_remember_me", :name => "user[remember_me]"
    end
    rendered.should have_selector("a[id='facebook_connect']") do |a|
      a.should have_selector("img[id='facebook']")
    end

     rendered.should have_selector("a[id='twitter_connect']") do |a|
      a.should have_selector("img[id='twitter']")
    end
  end
end
