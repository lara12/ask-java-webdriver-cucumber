Feature: Convert to Teacher

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################
  Background: Login
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    Given I open url "http://local.school.portnov.com:4520/#/login"
    When I type "nikita_teacher@amail.club" into element with xpath "//input[@formcontrolname='email']"
    And I type "0123456789" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
#########################################################################################################

  @3.End-To-End_tests
  Scenario: Convert Student to Teacher
    When I click on element with xpath "//h5[contains(text(),'Management')]" 2
    And I scroll to the element with xpath "//h4[contains(text(),'Dovgych100')]"
    And I click on element with xpath "//h4[contains(text(),'Dovgych100')]" 2
    And I click on element with xpath "//button[@color='accent']" 2
    And I click on element with xpath "(//button[@role='menuitem'])[2]" 2
    And I click on element with xpath "//span[contains(text(),'Change Role')]" 2
    And I wait for 3 sec
    Then element with xpath "//*[contains(text(),'nikita_student5@amail.club')]" should contain text "nikita_student5@amail.club"
    And element with xpath "//td[contains(text(),'TEACHER')]" should contain text "TEACHER"
    And I delete user "Dovgych100" which is a "Teacher" with "Teacher" credentials other user

#  @3._End-To-End_tests @Teacher
#  Scenario: Convert Student to Teacher
#    When I click on User's Management button
#    And I click on "Alexey Test" button
#    And I click on Options button
#    And I click on Change User's Role button
#    And I click on Change Change Role button
#    Then I validate that "Alexey Test" Role swap STUDENT to TEACHER
