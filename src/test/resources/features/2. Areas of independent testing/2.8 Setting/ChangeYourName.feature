Feature: 2.8.1 Change your name

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################
  Background: Login
    Given I open url "http://local.school.portnov.com:4520/#/login"
    When I type "nikita_teacher@amail.club" into element with xpath "//input[@formcontrolname='email']"
    When I type "0123456789" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']" 2
#########################################################################################################

  @Area_of_independent_testing
  Scenario: Input change own name
    Then I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    Then I click on element with xpath "//span[contains(text(),'Change Your Name')]" 2
    Then I clear element with xpath "//input[@placeholder='New name']"
    When I type "Nikitos Dovhych" into element with xpath "//input[@placeholder='New name']"
    Then I click on element with xpath "(//button[@aria-label='Close dialog'])[2]" 2
    Then I verify that required text "Nikitos Dovhych" and text with xpath "//td[contains(text(),'Nikitos Dovhych')]" is equal

  @Area_of_independent_testing
  Scenario: Input single character
    Then I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    Then I click on element with xpath "//span[contains(text(),'Change Your Name')]" 2
    Then I clear element with xpath "//input[@placeholder='New name']"
    When I type "N" into element with xpath "//input[@placeholder='New name']"
    Then I click on element with xpath "(//button[@aria-label='Close dialog'])[2]" 2
    Then I verify that text with xpath "//*[contains(text(),'Should contain only first and last name')]" is displayed

  @Area_of_independent_testing
  Scenario: Input letter and spesial characters
    Then I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    Then I click on element with xpath "//span[contains(text(),'Change Your Name')]" 2
    Then I clear element with xpath "//input[@placeholder='New name']"
    When I type "Dim@#$%$#@" into element with xpath "//input[@placeholder='New name']"
    Then I click on element with xpath "(//button[@aria-label='Close dialog'])[2]" 2
    Then I verify that text with xpath "//*[contains(text(),'Should contain only first and last name')]" is displayed

  @Area_of_independent_testing
  Scenario: Require field
    Then I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    Then I click on element with xpath "//span[contains(text(),'Change Your Name')]" 2
    Then I clear element with xpath "//input[@placeholder='New name']"
    Then I click on element with xpath "(//button[@aria-label='Close dialog'])[2]"
    Then I wait for 3 sec
    Then I verify that text with xpath "//*[contains(text(),'Should contain only first and last name')]" is displayed

  @Area_of_independent_testing
  Scenario: Input max 70 characters
    Then I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    Then I click on element with xpath "//span[contains(text(),'Change Your Name')]" 2
    Then I clear element with xpath "//input[@placeholder='New name']"
    When I type "ABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDE ABCDEABCDEABCDEABCDEABCDEABCD" into element with xpath "//input[@placeholder='New name']"
    Then I click on element with xpath "(//button[@aria-label='Close dialog'])[2]" 2
    Then I verify that required text "ABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDE ABCDEABCDEABCDEABCDEABCDEABCD" and text with xpath "//td[contains(text(),'ABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDE ABCDEABCDEABCDEABCDEABCDEABCD')]" is equal

