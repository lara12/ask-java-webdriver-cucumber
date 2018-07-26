Feature: Duplicate Email

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################

  @3.End-To-End_tests
  Scenario: Duplicate Email
    When I open url "http://local.school.portnov.com:4520/#/login"
    Then I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    Then I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    Then I type "Dovgich" into element with xpath "//input[@placeholder='Last Name']"
    Then I type "nikita_teacher@amail.club" into element with xpath "//input[@placeholder='Email']"
    Then I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    Then I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    Then I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    Then I wait for 2 sec
    Then element with xpath "//*[contains(text(),'User already exists and activated')]" should contain text "User already exists and activated"

#  Scenario: Duplicate Email
#    When I open page "login"
#    And I click on "Register Now" button
#    And I type "Nikita" into "First Name" field
#    And I type "Dovgich" into "Last Name" field
#    And I type "nikita_teacher@amail.club" into "Email" field
#    And I type "1111" into "Group Code" field
#    And I type "0123456789" into "Password" field
#    And I type "0123456789" into "Confirm Password" field
#    And I click on "Submit" button
#    But On the bottom of the page displayed snack bar with message "User already exists and activated"