Feature: Home Page
  Scenario: Register Page
    Given I am on the home page
    And I should follow register link
    Then I should see "Fields with * are required."

  Scenario: Login Page
    Given I am on the home page
    And I should follow Sign in link
    Then I should see "Fields with * are required."