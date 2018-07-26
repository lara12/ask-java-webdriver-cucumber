Feature: First Name

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################

  @Test_Objects/properties/methods
  Scenario: Single character input
    When I open url "http://local.school.portnov.com:4520/#/login"
    Then I click on element with xpath "//span[contains(text(),'Register Now')]"
    Then I type "Nikita" into element with xpath "//input[@placeholder='First Name']"
    Then I type "Dovgich" into element with xpath "//input[@placeholder='Last Name']"
    Then I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    Then I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    Then I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    Then I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    Then I wait for 2 sec
    When I open url "http://local.school.portnov.com:4520/#/login"
    When I type "nikita_teacher@amail.club" into element with xpath "//input[@formcontrolname='email']"
    When I type "0123456789" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']"
    Then I click on element with xpath "//h5[contains(text(),'Management')]"
    Then I scroll to the element with xpath "//h4[contains(text(),'Asol Zumash')]"


