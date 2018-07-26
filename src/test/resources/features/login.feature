Feature: Basic Authentication


  Scenario: User with valid credentials can login
    Given I open url "http://ask-stage.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"