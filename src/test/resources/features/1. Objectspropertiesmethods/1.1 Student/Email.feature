Feature: Email

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################

  @Test_Objects/properties/methods
  Scenario: Require field
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And element with xpath "//*[contains(text(),'This field is required')]" should be displayed no delete "Dovgych100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Invalid input no "@"
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5amail.club" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Dovgych100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Invalid input no "."
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@amailclub" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Dovgych100" as "Student" with "" credentials

  @Test_Objects/properties/methods
  Scenario: Invalid input no "domain"
    Given I open url "http://local.school.portnov.com:4520/#/login"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Register Now')]" 2
    And I type "Nikita" into element with xpath "//input[@placeholder='First Name']" 2
    And I type "Dovgych100" into element with xpath "//input[@placeholder='Last Name']"
    And I type "nikita_student5@" into element with xpath "//input[@placeholder='Email']"
    And I type "1111" into element with xpath "//input[@placeholder='Group Code']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
    And I type "0123456789" into element with xpath "//input[@placeholder='Confirm Password']"
    Then I click on element with xpath "//button[@type='submit']"
    And element with xpath "(//mat-error[contains(text(),'')])[1]" should be displayed no delete "Dovgych100" as "Student" with "" credentials
