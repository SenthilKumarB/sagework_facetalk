Given /^I am having user params$/ do
  @user = Factory.build(:user)
end

Given /^I enter required values to create user$/ do
  fill_in('user_username', :with => @user.username)
  fill_in('user_password', :with => @user.password)
  fill_in('user_password_confirmation', :with => @user.password_confirmation)
  fill_in('user_email', :with => @user.email)
  click_button 'Create'
end

When /^I have no user$/ do
	User.delete_all
end

Then /^I need to create new user$/ do
    @user.new_record?.should == true
end

