Feature: Comic slug

  Scenario: Create comic
    Given I am an admin user
    When I upload a comic with an image
    Then the comic should have slug
    And I should be able to access the comic using the slug