Feature: Password

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################

  @Test_Objects/properties/methods
  Scenario: Min valid input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgich100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "01234" into element with xpath "//input[@placeholder='Password']"
    And I type "01234" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And I delete user "Dovgich100" which is a "Student" with "" credentials other user

  @Test_Objects/properties/methods
  Scenario: Required field
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgich100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "" into element with xpath "//input[@placeholder='Password']"
    And I type "" into element with xpath "//input[@placeholder='Confirm Password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    Then element with xpath "//*[contains(text(),'This field is required')]" should be displayed no delete "Dovgich100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Input 4 characters
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgich100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123" into element with xpath "//input[@placeholder='Password']"
    And I type "0123" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Dovgych100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Max Character input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I input value with length 128 on field with xpath "//input[@placeholder='Password']" which include digits alphabet and special characters
    And I input value with length 128 on field with xpath "//input[@placeholder='Confirm Password']" which include digits alphabet and special characters
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
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I input value with length 129 on field with xpath "//input[@placeholder='Password']" which include digits alphabet and special characters
    And I input value with length 129 on field with xpath "//input[@placeholder='Confirm Password']" which include digits alphabet and special characters
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Dovgych100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Alphanumerical and special characters input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "Aa1$#" into element with xpath "//input[@placeholder='Password']"
    And I type "Aa1$#" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And I delete user "Dovgych100" which is a "Student" with "" credentials other user

  @Test_Objects/properties/methods
  Scenario: "Cut" menu item on "Password" field is disabled
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
#    Then I Cut inputed data from field with xpath "//input[@placeholder='Password']"
    When I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
#    Then I Cut inputed data from field with xpath "//input[@placeholder='Confirm Password']"

  @Test_Objects/properties/methods
  Scenario: "Copy" menu item on "Passwosd" field is disabled
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']" 2
    Then I verify that got value from the field with xpath "//input[@placeholder='Password']" is equal to "0123456789"
    When I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I verify that got value from the field with xpath "//input[@placeholder='Confirm Password']" is equal to "0123456789"

  @Test_Objects/properties/methods
  Scenario: Whitespace input
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type " " into element with xpath "//input[@placeholder='Password']"
    And I type " " into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Dovgych100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Whitespace input between characters
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "1234 5" into element with xpath "//input[@placeholder='Password']"
    And I type "1234 5" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 1 sec
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Dovgych100" as "Student" with "" credentials
    And element with xpath "(//mat-error[contains(text(),'')])[2]" should be displayed no delete "Dovgych100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Password field displays input in bullets
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And element with xpath "//input[@placeholder='Password' and @type='password']" should be enabled
    And element with xpath "//input[@placeholder='Confirm Password' and @type='password']" should be enabled
