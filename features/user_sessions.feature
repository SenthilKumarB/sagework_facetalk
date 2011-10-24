Feature: User Login Page

  Scenario: User login
    Given I am the registered user
    When I am on the login page
    When I login with valid credentials
    And I should see "Login successful!"