Feature: Login
  
  Scenario: Login with correct credentials
    Given an admin user
    When I log in with correct credentials
    Then I should be notified that I am logged in
    And I should be logged in

  Scenario: Login with incorrect credentials
    Given an admin user
    When I log in with incorrect credentials
    Then I should not be logged in