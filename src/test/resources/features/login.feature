Feature: Basic Authentication


  Scenario: User with valid credentials can login
    Given I open url "http://ask-stage.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    When I login whith valid user "balifo@bitwhites.top" and password "12345"
   # Then element with xpath "//p[contains(text(),'TEACHER')]" should be displayed
