
  #############          byIgor



Feature: Create user (Happy Pass)
  @ACA-495 @3End-To-End-tests @3.1
Scenario: Create user (happy path) cucumber
Given I open url "http://local.school.portnov.com:4520/#/registration"
Then I wait for element with xpath "//*[contains(text(),'Registration')]" to be present
When I type "Vasya1" into element with xpath "//*[@formcontrolname ='firstName']"
And I type "Smirnov" into element with xpath "//*[@formcontrolname='lastName']"
And I type "14434@com" into element with xpath "//*[@formcontrolname='email']"
And I type "A007" into element with xpath "//*[@formcontrolname='group']"
And I type "12345" into element with xpath "//*[@formcontrolname='password']"
And I type "12345" into element with xpath "//*[@formcontrolname='confirmPassword']"
And I click on element with xpath "//button[@type='submit']"
Then I wait for element with xpath "//*[contains(text(),'Your registration is completed now. To verify your')]" to be present