# ###################       General

#Peconditions: Dan Smith -teacher account and Eva Studentka - student account, Quiz - "do not delete cucumber". Eva Studentka shouldn't have assignment "do not delete cucumber".

#Feature: SubmissionTime
#
#  Scenario: SubmissionTime
#    Given Login as a teacher
#    When Teacher create Assignment
#    And Teacher assign Quiz to Student
#    Then Student should has Quiz as his Assignment
#    Then Teacher logout
#    Then Login as a student
#    And  Student submits assignment
#    And  Student logout
#    When Teacher login
#    Then compare time
#

  #############          byIgor
#  There is chance the test fails in 1.67% :))
#  Guess why??? :)
#  You may fix it if you can.

@1._Objectspropertiesmethods @1.6.1 @ACA-793
Feature: SubmiisionTime

  Scenario: SubmissionTime
#    Teacher login
    Given I open url "http://local.school.portnov.com:4520/#/login"
    Then I should see page title contains "Assessment Control @ Portnov"
    Then element with xpath "//*[@placeholder='Email *']" should be present
    When I type "hilurih@shinnemo.com" into element with xpath "//*[@placeholder='Email *']"
    Then element with xpath "//*[@placeholder='Password *']" should be present
    When I type "12345" into element with xpath "//*[@placeholder='Password *']"
    And  I click on element using JavaScript with xpath "//span[contains(text(),'Sign In')]"
#    Teacher cteates Assignment
    Then I wait for element with xpath "//*[contains(text(),'Assignments')]/../../..//*[@*='img']" to be present
    When I click on element using JavaScript with xpath "//*[contains(text(),'Assignments')]/../../..//*[@*='img']"
    Then I wait for element with xpath "//*[contains(text(),'Create New Assignment')]/../..//button" to be present
    When I click on element using JavaScript with xpath "//*[contains(text(),'Create New Assignment')]/../..//button"
    Then I wait for element with xpath "//*[@*='mat-select-arrow']/../..//*[contains(text(),'Select Quiz')]" to be present
    Then I wait for 5 sec
    When I click on element with xpath "//*[@*='mat-select-arrow']/../..//*[contains(text(),'Select Quiz')]"
    And I wait for element with xpath "//span[contains(text(),'cucumber do not delete')]" to be present
    When I click on element using JavaScript with xpath "//span[contains(text(),'cucumber do not delete')]"
    Then I click on element "Eva Studentka" using JavaScript
    Then I wait for element with xpath "//*[contains(text(),'Give Assignment')]/../../button" to be present
    When I click on element using JavaScript with xpath "//*[contains(text(),'Give Assignment')]/../../button"
    Then I wait for 4 sec
    Then I click on element using JavaScript with xpath "//*[contains(text(),'cucumber do not delete')]"
    Then I wait for element with xpath "//*[contains(text(),'cucumber do not delete')]/../../..//*[contains(text(),'Pending')]" to be present
    Then element with xpath "//*[contains(text(),'cucumber do not delete')]/../../..//*[contains(text(),'Eva Studentka')]" should be present
    Then I click on element with xpath "//*[contains(text(),'Log Out')]"
    Then I click on element with xpath "//*[@*='Close dialog'][2]"
#    Student login
    Then I wait for element with xpath "//*[@placeholder='Email *']" to be present
    When I type "student@pay-mon.com" into element with xpath "//*[@placeholder='Email *']"
    Then element with xpath "//*[@placeholder='Password *']" should be present
    When I type "12345" into element with xpath "//*[@placeholder='Password *']"
    And  I click on element using JavaScript with xpath "//span[contains(text(),'Sign In')]"
#    Students takes Assesment
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
#    Remembering Student submitted time
    Then I click and remember as SubmittedTime on element using JavaScript with xpath "//*[contains(text(),'cucumber do not delete')]/../td[1]"
    Then I click on element with xpath "//*[contains(text(),'Log Out')]"
    Then I click on element with xpath "//*[@*='Close dialog'][2]"
#    Teacher login
    Then I wait for element with xpath "//*[@placeholder='Email *']" to be present
    When I type "hilurih@shinnemo.com" into element with xpath "//*[@placeholder='Email *']"
    Then element with xpath "//*[@placeholder='Password *']" should be present
    When I type "12345" into element with xpath "//*[@placeholder='Password *']"
    And  I click on element using JavaScript with xpath "//span[contains(text(),'Sign In')]"
    Then I wait for element with xpath "//*[contains(text(),'Assignments')]/../../..//*[@*='img']" to be present
    When I click on element using JavaScript with xpath "//*[contains(text(),'Assignments')]/../../..//*[@*='img']"
    Then I wait for element with xpath "//*[contains(text(),'cucumber do not delete')]" to be present
    Then I click on element using JavaScript with xpath "//*[contains(text(),'cucumber do not delete')]"
    Then element with xpath "//*[contains(text(),'cucumber do not delete')]/../../..//*[contains(text(),'Eva Studentka')]/..//*[contains(text(),'Review')]" should be present
    Then I wait for 3 sec
    Then I click on element with xpath "//*[contains(text(),'cucumber do not delete')]/../../..//*[contains(text(),'Eva Studentka')]/..//*[contains(text(),'Review')]" 2
#    Comparing time
    Then I compare the submitted time as SubmittedTime and time from xpath "//*[contains(text(),'Submitted At:')]/../td[2]"
#    Clean up
    When I click on element using JavaScript with xpath "//*[contains(text(),'Assignments')]/../../..//*[@*='img']"
    Then element with xpath "//*[contains(text(),'cucumber do not delete')]/../../..//*[contains(text(),'Eva Studentka')]" should be present
    Then I click on element using JavaScript with xpath "//*[contains(text(),'cucumber do not delete')]/../../..//*[contains(text(),'Eva Studentka')]/../../../../../..//button"
    Then I wait for element with xpath "//*[contains(text(),'Delete Assignment')]" to be present
    Then I click on element with xpath "//*[contains(text(),'Delete Assignment')]"
    Then I wait for element with xpath "//*[contains(text(),'Delete')]" to be present
    Then I click on element with xpath "//*[@*='Close dialog'][2]"
    Then I wait for 3 sec
    Then element with xpath "//*[contains(text(),'cucumber do not delete')]/../../..//*[contains(text(),'Eva Studentka')]" should not be present
#      done