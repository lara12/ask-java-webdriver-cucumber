Feature: Email

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################
Background: Login
  Given I open url "http://local.school.portnov.com:4520/#/login"
  And I wait for 1 sec
  When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
  And I type "Nikita100" into element with xpath "//input[@placeholder='First Name']" 2
  And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
  And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
  And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
  And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
  And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
  Then I click on element with xpath "//button[@type='submit']"
  And I wait for 3 sec
  Given login as teacher username "nikita_teacher@amail.club" password "0123456789"
  When I click on element with xpath "//h5[contains(text(),'Quizzes')]" 2
  And I click on element with xpath "//span[contains(text(),'Create New Quiz')]" 2
  And I type "My Quizze" into element with xpath "//input[@formcontrolname='name']" 2
  And I click on element with xpath "//mat-icon[contains(text(),'add_circle')]" 2
  And I click on element with xpath "//*[contains(text(),'Textual')]" 2
  And I type "Question" into element with xpath "//textarea[@placeholder]" 2
  And I click on element with xpath "//mat-icon[contains(text(),'add_circle')]" 2
  And I click on element with xpath "(//*[contains(text(),'Textual')])[2]" 2
  And I type "Question two" into element with xpath "(//textarea[@placeholder])[2]" 2
  Then I click on element with xpath "//span[contains(text(),'Save')]" 2
  And I wait for 2 sec
#########################################################################################################

  @Test_Objects/properties/methods
  Scenario: Select Student
    When I click on element with xpath "//h5[contains(text(),'Assignments')]" 2
    And I click on element with xpath "//span[contains(text(),'Create New Assignment')]" 2
    And I click on element with xpath "//span[contains(text(),'Select Quiz To Assign')]" 2
    And I scroll to the element with xpath "//span[contains(text(),'My Quizze')]"
    And I click on element with xpath "//span[contains(text(),'My Quizze')]" 2
    And I click on element "//form//div//div[contains(., 'Nikita100 Dovgych100')]" using JavaScript
    And I click on element with xpath "//span[text()='Give Assignment']" 2
    Then I wait for 3 sec
    When I scroll to the element with xpath "//*[contains(text(),'My Quizze')]"
    And I click on element with xpath "//*[contains(text(),'My Quizze')]" 2
    Then element with xpath "//*[contains(text(),'Quiz: QA')]/../../..//*[contains(text(),'fdhfgj hgkhliuli')]" should be present
    #cleanup
    When I click on element with xpath "//*[contains(text(),'Quiz: QA')]/..//button" 2
    And I click on element with xpath "//*[contains(text(),'Delete')]" 2
    And I click on element with xpath "//*[@*='Close dialog'][2]" 2
    And I scroll to the element with xpath "//mat-panel-title[contains(text(),'My Quizze')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'My Quizze')]" 2
    And I click on element with xpath "(//mat-panel-title[contains(text(),'My Quizze')]/../../..//button)[3]" 2
    And I click on element with xpath "(//button[@aria-label='Close dialog'])[2]" 2
    Then I wait for 2 sec
    And I delete user "Dovgych100" which is a "Student" with "Teacher" credentials other user
