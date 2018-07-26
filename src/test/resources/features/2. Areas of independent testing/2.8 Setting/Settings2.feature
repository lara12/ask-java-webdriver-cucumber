@Area_of_independent_testing
Feature: 2.8.3 Setting

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################
  Background: Login
    Given I open url "http://local.school.portnov.com:4520/#/login"
    When I type "nikita_student@amail.club" into element with xpath "//input[@formcontrolname='email']"
    When I type "0123456789" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']"
#########################################################################################################

  @Area_of_independent_testing
  Scenario: Verify user can push setting buttom
    Then I click on element with xpath "//h5[contains(text(),'Setting')]"
    Then I wait for 2 sec
    Then element with xpath "//h4[contains(text(),'Setting')]" should be disabled

