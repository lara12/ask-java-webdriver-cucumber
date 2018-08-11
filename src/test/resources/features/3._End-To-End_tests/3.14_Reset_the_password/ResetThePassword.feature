  #############          byIgor




@3End-To-End-tests @3.14 @ACA-???
Feature: Reset Password
  Scenario: Reset Password Happy Pass
Given I open url "http://local.school.portnov.com:4520/#/login"
Then I should see page title contains "Assessment Control @ Portnov"
And element with xpath "//a[@href='/#/forgot-password']" should be present
When I click on element using JavaScript with xpath "//a[@href='/#/forgot-password']"
Then element with xpath "//*[contains(text(),'Reset Password Request')]" should be present
When I type "hilurih@shinnemo.com" into element with xpath "//*[@formcontrolname='email']"
Then I click on element using JavaScript with xpath "//button[@type='submit']"
And I wait for element with xpath "//*[contains(text(),'sent you email')]" to be present
#    done