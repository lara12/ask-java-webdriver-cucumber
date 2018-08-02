Feature: test

  Background: Delete account
   Given I open url "http://local.school.portnov.com:4520/#/login"
  When I type "nikita_teacher@amail.club" into element with xpath "//input[@formcontrolname='email']"
  And I type "0123456789" into element with xpath "//input[@formcontrolname='password']"
  Then I click on element with xpath "//button[@type='submit']"


  Scenario: Create Assignment (by teacher) cucumber
    When I click on element with xpath "//h5[contains(text(),'Assignments')]" 2
    And I click on element with xpath "//span[contains(text(),'Create New Assignment')]" 2
    And I click on element with xpath "//span[contains(text(),'Select Quiz To Assign')]" 2
    And I scroll to the element with xpath "//span[contains(text(),'22222')]"
    And I click on element with xpath "//span[contains(text(),'22222')]" 2
#    And I click on element with xpath "software ahdjvfh       " 2
    And Find element "software ahdjvfh"
#    And I scroll to the element with xpath "Elena Student@"
#    And I click on element with xpath "Elena Student@" 2
    And Find element "Smruti Vaidya"
    And I wait for 10 sec

