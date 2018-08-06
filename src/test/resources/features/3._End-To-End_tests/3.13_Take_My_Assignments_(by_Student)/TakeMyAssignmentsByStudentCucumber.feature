# ###################       General

#Feature: TakeMyAssignmentsByStudentCucumber
#
#  Scenario: TakeMyAssignmentsByStudentCucumber
#    Given Login as a teacher
#    When Teacher create Assignment
#    And Teacher assign Quiz to Student
#    Then Student should has Quiz as his Assignment
#    Then Teacher logout
#    Then Login as a student
#    And  Student submits assignment
#

#  ################          byIgor

@3End-To-End-tests @3.13 @ACA-633
Feature: TakeMyAssignmentsByStudentCucumber

  Scenario: TakeMyAssignmentsByStudentCucumber
    Given I open url "http://local.school.portnov.com:4520/#/login"
    Then I should see page title contains "Assessment Control @ Portnov"
    Then element with xpath "//*[@placeholder='Email *']" should be present
    When I type "hilurih@shinnemo.com" into element with xpath "//*[@placeholder='Email *']"
    Then element with xpath "//*[@placeholder='Password *']" should be present
    When I type "12345" into element with xpath "//*[@placeholder='Password *']"
    And  I click on element using JavaScript with xpath "//span[contains(text(),'Sign In')]"
    Then I wait for element with xpath "//*[contains(text(),'Assignments')]/../../..//*[@*='img']" to be present
    When I click on element using JavaScript with xpath "//*[contains(text(),'Assignments')]/../../..//*[@*='img']"
    Then I wait for element with xpath "//*[contains(text(),'Create New Assignment')]/../..//button" to be present
    When I click on element using JavaScript with xpath "//*[contains(text(),'Create New Assignment')]/../..//button"
    Then I wait for element with xpath "//*[@*='mat-select-arrow']/../..//*[contains(text(),'Select Quiz')]" to be present
    Then I wait for 5 sec
    When I click on element with xpath "//*[@*='mat-select-arrow']/../..//*[contains(text(),'Select Quiz')]"
    Then I click on element "Eva Studentka" using JavaScript
    Then I wait for element with xpath "//*[contains(text(),'Give Assignment')]/../../button" to be present
    When I click on element using JavaScript with xpath "//*[contains(text(),'Give Assignment')]/../../button"
    And I wait for element with xpath "//span[contains(text(),'cucumber do not delete')]" to be present
    Then I wait for 2 sec
    When I click on element using JavaScript with xpath "//span[contains(text(),'cucumber do not delete')]"
    Then I click on element using JavaScript with xpath "//button[@type='submit']"
    Then I click on element using JavaScript with xpath "//*[contains(text(),'cucumber do not delete')]"
    Then I wait for element with xpath "//*[contains(text(),'cucumber do not delete')]/../../..//*[contains(text(),'Pending')]" to be present
    Then I click on element using JavaScript with xpath "//*[contains(text(),'cucumber do not delete')]"
    Then element with xpath "//*[contains(text(),'cucumber do not delete')]/../../..//*[contains(text(),'Eva Studentka')]" should be present
    Then I click on element with xpath "//*[contains(text(),'Log Out')]"
    Then I click on element with xpath "//*[@*='Close dialog'][2]"
    Then I wait for element with xpath "//*[@placeholder='Email *']" to be present
    When I type "student@pay-mon.com" into element with xpath "//*[@placeholder='Email *']"
    Then element with xpath "//*[@placeholder='Password *']" should be present
    When I type "12345" into element with xpath "//*[@placeholder='Password *']"
    And  I click on element using JavaScript with xpath "//span[contains(text(),'Sign In')]"
    Then I wait for element with xpath "//*[contains(text(),'Assignments')]/../../..//*[@*='img']" to be present
    When I click on element using JavaScript with xpath "//*[contains(text(),'Assignments')]/../../..//*[@*='img']"
    Then I wait for element with xpath "//button" to be present
    Then I click on element with xpath "//button"
    Then I type "123" into element with xpath "//*[@*='Enter your answer']"
    Then I wait for 1 sec
    Then I click on element with xpath "(//*[@class='mat-radio-label'])[1]" 2
    Then I click on element with xpath "(//*[@class='mat-checkbox-layout'])[1]" 2
    Then I click on element with xpath "//button//*[contains(text(),'Submit My Answers')]" 2
    Then I click on element with xpath "//*[@*='Close dialog']//*[contains(text(),'Ok')]" 2
    Then I click on element with xpath "//*[contains(text(),'My Grades')]" 2
    Then I wait for element with xpath "//*[contains(text(),'cucumber do not delete')]" to be present
    Then I click on element with xpath "//*[contains(text(),'Log Out')]"
    Then I click on element with xpath "//*[@*='Close dialog'][2]"
#    now delete our assignment
    Then I wait for element with xpath "//*[@placeholder='Email *']" to be present
    When I type "hilurih@shinnemo.com" into element with xpath "//*[@placeholder='Email *']"
    Then element with xpath "//*[@placeholder='Password *']" should be present
    When I type "12345" into element with xpath "//*[@placeholder='Password *']"
    And  I click on element using JavaScript with xpath "//span[contains(text(),'Sign In')]"
    Then I wait for element with xpath "//*[contains(text(),'Assignments')]/../../..//*[@*='img']" to be present
    When I click on element using JavaScript with xpath "//*[contains(text(),'Assignments')]/../../..//*[@*='img']"
    Then I wait for element with xpath "//*[contains(text(),'cucumber do not delete')]" to be present
    Then I click on element using JavaScript with xpath "//*[contains(text(),'cucumber do not delete')]"
    Then I click on element using JavaScript with xpath "//*[contains(text(),'cucumber do not delete')]"
    Then element with xpath "//*[contains(text(),'cucumber do not delete')]/../../..//*[@*='name']" has the same name of student
    Then I click on element using JavaScript with xpath "//*[contains(text(),'cucumber do not delete')]/..//button"
    Then I wait for element with xpath "//*[contains(text(),'Delete Assignment')]" to be present
    Then I click on element with xpath "//*[contains(text(),'Delete Assignment')]"
    Then I wait for element with xpath "//*[contains(text(),'Delete')]" to be present
    Then I click on element with xpath "//*[@*='Close dialog'][2]"
    Then I wait for 4 sec
    Then element with xpath "//*[contains(text(),'cucumber do not delete')]/../../..//*[@*='name']" should not be present
#      done