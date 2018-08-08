Feature: Last Name

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
    And I type "Nikita100" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "k" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And I delete user "Nikita100" which is a "Student" with "" credentials other user

  @Test_Objects/properties/methods
  Scenario: Required field
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita100" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    Then element with xpath "//*[contains(text(),'This field is required')]" should be displayed no delete "Nikita100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Alphanumerical and special characters input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita100#" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Aa1$" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And I delete user "Nikita100" which is a "Student" with "" credentials other user

  @Test_Objects/properties/methods
  Scenario: Max Character input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita100" into element with xpath "//input[@placeholder='First Name']"
    And I input value with length 100 on field with xpath "//input[@placeholder='Last Name']" which include digits alphabet and special characters
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And I delete user "Nikita100" which is a "Student" with "" credentials other user

  @Test_Objects/properties/methods
  Scenario: Max character +1 input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita100" into element with xpath "//input[@placeholder='First Name']"
    And I input value with length 101 on field with xpath "//input[@placeholder='Last Name']" which include digits alphabet and special characters
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Nikita100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: "Russian characters input"
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita100" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "привет" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Nikita100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Whitespace input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita100" into element with xpath "//input[@placeholder='First Name']" 2
    And I type " " into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Nikita100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Whitespace + charcters input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita100" into element with xpath "//input[@placeholder='First Name']" 2
    And I type " k" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Nikita100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Characters + Whitespace input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita100" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "k " into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Nikita100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Whitespace between elements
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita100" into element with xpath "//input[@placeholder='First Name']" 2
    And I type " k " into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Nikita100" as "Student" with "" credentials
