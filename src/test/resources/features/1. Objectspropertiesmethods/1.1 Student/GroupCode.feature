Feature: Group Code

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################

  @Test_Objects/properties/methods
  Scenario: Single character input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And I delete user "Dovgych100" which is a "Student" with "" credentials other user

  @Test_Objects/properties/methods
  Scenario: Require field
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Dovgych100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Alphanumerical and special chracters input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "Aa1$#" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And I delete user "Dovgych100" which is a "Student" with "" credentials other user

  @Test_Objects/properties/methods
  Scenario: Max character +1 input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I input value with length 7 on field with xpath "//input[@placeholder='Group Code']" which include digits alphabet and special characters
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Dovgych100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Max character input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I input value with length 6 on field with xpath "//input[@placeholder='Group Code']" which include digits alphabet and special characters
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And I delete user "Dovgych100" which is a "Student" with "" credentials other user
