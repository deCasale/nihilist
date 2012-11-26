Feature: Comic management

  Scenario: Upload comic without an image
    Given I am an admin user
    When I upload a comic without an image
    Then the comic should be saved
    And I should be redirected to the comic as admin
    And I should not see the image

  Scenario: Upload comic with an image
    Given I am an admin user
    When I upload a comic with an image
    Then the comic should be saved
    And I should be redirected to the comic as admin
    And I should see the image

  Scenario: List comics
    Given I am an admin user
    And I have some comics
    Then I should see them in the list

  Scenario: Remove comic
    Given I am an admin user
    And I have some comics
    When I remove the comic
    Then it should not be in the list of comics
