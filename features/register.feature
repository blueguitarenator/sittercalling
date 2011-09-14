Feature: Register
  In order to use the application
  As a user
  I want to sign up to gain access to the application
  
  Scenario: Creating an account
    Given I am on homepage
    When I go to signup
    And I submit my chosen username and my email address
    Then I should see "Your Network"
    And I should be on the user page for "rich@msn.com"
