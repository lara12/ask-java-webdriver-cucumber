@ChangeYourName
Feature: 2.8.1 Change your name

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################
  Background: Login
    Given I open url "http://local.school.portnov.com:4520/#/login"
    When I type "nikita_student@amail.club" into element with xpath "//input[@formcontrolname='email']"
    And I type "0123456789" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']"
#########################################################################################################

  @Area_of_independent_testing
  Scenario: Input change own name
    When I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    And I click on element with xpath "//span[contains(text(),'Change Your Name')]" 2
    And I clear element with xpath "//input[@placeholder='New name']"
    And I type "Nikitos Dovhych" into element with xpath "//input[@placeholder='New name']"
    And I click on element with xpath "(//button[@aria-label='Close dialog'])[2]" 2
    Then I verify that required text "Nikitos Dovhych" and text with xpath "//td[contains(text(),'Nikitos Dovhych')]" is equal

  @Area_of_independent_testing
  Scenario: Input single character
    When I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    And I click on element with xpath "//span[contains(text(),'Change Your Name')]" 2
    And I clear element with xpath "//input[@placeholder='New name']"
    And I type "N" into element with xpath "//input[@placeholder='New name']"
    And I click on element with xpath "(//button[@aria-label='Close dialog'])[2]" 2
    Then I verify that text with xpath "//*[contains(text(),'Should contain only first and last name')]" is displayed

  @Area_of_independent_testing
  Scenario: Input letter and spesial characters
    When I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    And I click on element with xpath "//span[contains(text(),'Change Your Name')]" 2
    And I clear element with xpath "//input[@placeholder='New name']"
    And I type "Dim@#$%$#@" into element with xpath "//input[@placeholder='New name']"
    And I click on element with xpath "(//button[@aria-label='Close dialog'])[2]" 2
    Then I verify that text with xpath "//*[contains(text(),'Should contain only first and last name')]" is displayed

  @Area_of_independent_testing
  Scenario: Require field
    When I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    And I click on element with xpath "//span[contains(text(),'Change Your Name')]" 2
    And I clear element with xpath "//input[@placeholder='New name']"
    And I click on element with xpath "(//button[@aria-label='Close dialog'])[2]"
    And I wait for 3 sec
    Then I verify that text with xpath "//*[contains(text(),'Should contain only first and last name')]" is displayed

  @Area_of_independent_testing
  Scenario: Input max 70 characters
    When I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    And I click on element with xpath "//span[contains(text(),'Change Your Name')]" 2
    And I clear element with xpath "//input[@placeholder='New name']"
    And I type "ABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDE ABCDEABCDEABCDEABCDEABCDEABCD" into element with xpath "//input[@placeholder='New name']"
    And I click on element with xpath "(//button[@aria-label='Close dialog'])[2]" 2
    Then I verify that required text "ABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDE ABCDEABCDEABCDEABCDEABCDEABCD" and text with xpath "//td[contains(text(),'ABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDEABCDE ABCDEABCDEABCDEABCDEABCDEABCD')]" is equal

