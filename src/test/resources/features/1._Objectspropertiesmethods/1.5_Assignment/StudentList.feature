Feature: Email

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################
Background: Login
  Given login as teacher username "nikita_teacher@amail.club" password "0123456789"
#########################################################################################################

  @Test_Objects/properties/methods
  Scenario: Select Student
    When I click on element with xpath "//h5[contains(text(),'Assignments')]" 2
    And I click on element with xpath "//span[contains(text(),'Create New Assignment')]" 2
    And I click on element with xpath "//span[contains(text(),'Select Quiz To Assign')]" 2
    And I scroll to the element with xpath "//span[contains(text(),'22222')]"
    And I click on element with xpath "//span[contains(text(),'22222')]" 2
    And I click on element "software ahdjvfh" using JavaScript
    And I wait for 1 sec
