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