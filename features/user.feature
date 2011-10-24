Feature: Creating User

	Scenario: creating new user
        Given I am on the register page
        Given I am having user params
		Given I enter required values to create user
		Given I have no user
		And I need to create new user
        Then I should see "Registered Successfully"
