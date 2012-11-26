Feature: Comic slug

  Scenario: Create comic
    Given I am an admin user
    When I upload a comic with an image
    Then the comic should have slug
    And I should be able to access the comic using the slug

  Scenario: Create comics with same titles
    Given I am an admin user
    When I upload some comics with same titles
    Then all comics should have uniqe slugs