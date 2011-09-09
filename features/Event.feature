Feature: Event
  In order to schedule a sitter
  I want to create sitter events
  
  Background:
    Given I am on homepage
    And I am logged in
    
    
  
  Scenario: Creating an event
    Given I follow "addEvent"
    When I submit my "Xmas Party" titled event
    Then I should be on the event page for "Xmas Party"
    And I should see "Xmas Party"
    