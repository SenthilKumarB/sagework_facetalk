Given /^I am the registered user$/ do
  @user = Factory(:user)
end

When /^I login with valid credentials$/ do
  fill_in('user_session_username', :with => @user.username)
  fill_in('user_session_password', :with => @user.password)
  click_button 'Login'
end