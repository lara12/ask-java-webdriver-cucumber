Feature: Convert to Teacher

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################
  Background: Login
    Given I open url "http://local.school.portnov.com:4520/#/login"
    When I type "nikita_teacher@amail.club" into element with xpath "//input[@formcontrolname='email']"
    When I type "0123456789" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']"
#########################################################################################################

  @3.End-To-End_tests
  Scenario: Convert Student to Teacher
    Then I click on element with xpath "//h5[contains(text(),'Management')]" 2
    Then I click on element with xpath "//h4[contains(text(),'Alexey Test')]" 2
    Then I click on element with xpath "//button[@color='accent']" 2
    Then I click on element with xpath "(//button[@role='menuitem'])[2]" 2
    Then I click on element with xpath "//span[contains(text(),'Change Role')]" 2
    Then I wait for 2 sec
    Then element with xpath "//*[contains(text(),'a.ulashchick+123@gmail.com')]" should contain text "a.ulashchick+123@gmail.com"
    Then element with xpath "//td[contains(text(),'TEACHER')]" should contain text "TEACHER"

#  @3._End-To-End_tests @Teacher
#  Scenario: Convert Student to Teacher
#    When I click on User's Management button
#    And I click on "Alexey Test" button
#    And I click on Options button
#    And I click on Change User's Role button
#    And I click on Change Change Role button
#    Then I validate that "Alexey Test" Role swap STUDENT to TEACHER
