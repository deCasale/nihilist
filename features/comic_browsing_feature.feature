Feature: Comic browsing
  
  @javascript
  Scenario: No comics
    Given there are no comics
    And I visit the homepage
    Then I should see the navigation
    And navigation links should be disabled

  @javascript
  Scenario: One comic
    Given I have one comic
    And I visit the homepage
    Then I should see the navigation
    And first and last links should lead to the first comic
    And next and previous links should be disabled
    And random link should be disabled
    And I should see the last comic

  @javascript
  Scenario: Few comics
    Given I have some comics
    And I visit the homepage
    Then I should see the navigation
    And I should see the last comic
    And the first link should lead to the first comic
    And the last link should lead to the last comic
    And random link should lead to some comic

  @javascript
  Scenario: Browsing comics last to first
    Given I have some comics
    And I visit the homepage
    Then I should be able to get to the first comic using the previous button

  @javascript
  Scenario: Browsing comics from first to last
    Given I have some comics
    And I visit the first comic
    Then I should be able to get to the last comic usign the next button

  Scenario: Display comic image
    Given I have one comic with image
    And I go to the comic image url
    Then I should get an image