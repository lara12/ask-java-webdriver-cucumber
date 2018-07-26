Feature: 3.10 Delete (happy pass)

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################
  Background: Login
    Given I open url "http://local.school.portnov.com:4520/#/login"
    When I type "nikita_teacher@amail.club" into element with xpath "//input[@formcontrolname='email']" 2
    When I type "0123456789" into element with xpath "//input[@formcontrolname='password']" 2
    Then I click on element with xpath "//button[@type='submit']" 2
    Then I click on element with xpath "//h5[contains(text(),'Quizzes')]" 2
    Then I click on element with xpath "//span[contains(text(),'Create New Quiz')]" 2
    Then I type "My Quizze" into element with xpath "//input[@formcontrolname='name']" 2
    Then I click on element with xpath "//mat-icon[contains(text(),'add_circle')]" 2
    Then I click on element with xpath "//*[contains(text(),'Textual')]" 2
    Then I type "Question" into element with xpath "//textarea[@placeholder]" 2
    Then I click on element with xpath "//mat-icon[contains(text(),'add_circle')]" 2
    Then I click on element with xpath "//*[contains(text(),'Textual')]" 2
    Then I type "Question two" into element with xpath "//textarea[@placeholder]" 2
    Then I click on element with xpath "//span[contains(text(),'Save')]" 2
#########################################################################################################

  @3.End-To-End_tests
  Scenario: Delete Quiz
    Then I scroll to the element with xpath "//mat-panel-title[contains(text(),'My Quizze')]"
    Then I click on element with xpath "(//mat-panel-title[contains(text(),'My Quizze')]/../../..//button)[3]" 2
    Then I click on element with xpath "(//button[@aria-label='Close dialog'])[2]" 2
    Then element with xpath "//mat-panel-title[contains(text(),'My Quizze')]" should not be present
