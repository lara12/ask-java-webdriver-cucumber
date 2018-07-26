Feature: WebDriver test

  @webdriver1
  Scenario: Open the page
    Given I go to the "http://ask-stage.portnov.com" page and print details
    And I go back and forward and refresh the page
    And I print logs to console
