@Area_of_independent_testing
Feature: 2.8.2 Change your password

#########################################################################################################
#
#  This file was created by Nikitos
#
#########################################################################################################
  Background: Login
    Given I open url "http://local.school.portnov.com:4520/#/login"
    When I type "nikita_teacher@amail.club" into element with xpath "//input[@formcontrolname='email']"
    And I type "0123456789" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']"
#########################################################################################################

  @Area_of_independent_testing
  Scenario: User can change password
    When I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    And I click on element with xpath "//span[contains(text(),'Change Your Password')]" 2
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']" 2
    And I type "9876543210" into element with xpath "//input[@placeholder='New Password']"
    And I type "9876543210" into element with xpath "//input[@placeholder='Confirm New Password']"
    Then I click on element with xpath "(//button[@aria-label])[2]" 2
    When I click on element with xpath "//h5[contains(text(),'Log Out')]" 2
    And I click on element with xpath "(//button[@aria-label])[2]" 2
    And I type "nikita_teacher@amail.club" into element with xpath "//input[@formcontrolname='email']" 2
    And I type "9876543210" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']" 2
    And I wait for 3 sec
    Then element with xpath "//h3[contains(text(),'Nikita Dovhych')]" should be displayed
    And Revert to back "Password" old "9876543210" new1 "0123456789"

  @Area_of_independent_testing
  Scenario: Input 4 characters in password field
    When I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    And I click on element with xpath "//span[contains(text(),'Change Your Password')]" 2
    And I type "9876543210" into element with xpath "//input[@placeholder='Password']" 2
    And I type "9876" into element with xpath "//input[@placeholder='New Password']"
    And I type "9876" into element with xpath "//input[@placeholder='Confirm New Password']"
    And I click on element with xpath "(//button[@aria-label])[2]" 2
    And I wait for 1 sec
    Then element with xpath "//mat-error[contains(text(),'Too short. Should be at least 5 characters')]" should contain text "Too short. Should be at least 5 characters"

  @Area_of_independent_testing
  Scenario: Input max characters in password field
    When I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    And I click on element with xpath "//span[contains(text(),'Change Your Password')]" 2
    And I type "9876543210" into element with xpath "//input[@placeholder='Password']" 2
    And I type "01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567" into element with xpath "//input[@placeholder='New Password']"
    And I type "01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567" into element with xpath "//input[@placeholder='Confirm New Password']"
    Then I click on element with xpath "(//button[@aria-label])[2]" 2
    When I click on element with xpath "//h5[contains(text(),'Log Out')]" 2
    And I click on element with xpath "(//button[@aria-label])[2]" 2
    And I type "nikita_teacher@amail.club" into element with xpath "//input[@formcontrolname='email']"
    And I type "01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
    Then I should see page title as "//h3[contains(text(),'Nikita Dovhych')]"
    And Revert to back "Password" old "01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567" new1 "0123456789"

  @Area_of_independent_testing
  Scenario: Password field displays input in bullets
    When I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    And I click on element with xpath "//span[contains(text(),'Change Your Password')]" 2
    And I wait for 2 sec
    Then element with xpath "//input[@placeholder='Password' and @type='password']" should be enabled
    And element with xpath "//input[@placeholder='New Password' and @type='password']" should be enabled
    And element with xpath "//input[@placeholder='Confirm New Password' and @type='password']" should be enabled

  @Area_of_independent_testing
  Scenario: "Cut" menu item on "Password" field is disabled
    When I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    And I click on element with xpath "//span[contains(text(),'Change Your Password')]" 2
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']"
#    Then I Cut inputed data from field with xpath "//input[@placeholder='Password']"
    When I type "9876543210" into element with xpath "//input[@placeholder='New Password']"
#    Then I Cut inputed data from field with xpath "//input[@placeholder='New Password']"
    When I type "9876543210" into element with xpath "//input[@placeholder='Confirm New Password']"
#    Then I Cut inputed data from field with xpath "//input[@placeholder='Confirm New Password']"

  @Area_of_independent_testing
  Scenario: "Copy" menu item on "Passwosd" field is disabled
    When I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    And I click on element with xpath "//span[contains(text(),'Change Your Password')]" 2
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']" 2
    Then I verify that got value from the field with xpath "//input[@placeholder='Password']" is equal to "0123456789"
    When I type "9876543210" into element with xpath "//input[@placeholder='New Password']"
    Then I verify that got value from the field with xpath "//input[@placeholder='New Password']" is equal to "0123456789"
    When I type "9876543210" into element with xpath "//input[@placeholder='Confirm New Password']"
    Then I verify that got value from the field with xpath "//input[@placeholder='Confirm New Password']" is equal to "0123456789"

  @Area_of_independent_testing
  Scenario: "Verify user can create password with spesial characters"
    When I click on element with xpath "//h5[contains(text(),'Setting')]" 2
    And I click on element with xpath "//span[contains(text(),'Change Your Password')]" 2
    And I type "0123456789" into element with xpath "//input[@placeholder='Password']" 2
    And I type "@#%#%#@%^*" into element with xpath "//input[@placeholder='New Password']"
    And I type "@#%#%#@%^*" into element with xpath "//input[@placeholder='Confirm New Password']"
    Then I click on element with xpath "(//button[@aria-label])[2]"
    When I click on element with xpath "//h5[contains(text(),'Log Out')]" 2
    And I click on element with xpath "(//button[@aria-label])[2]" 2
    And I type "nikita_teacher@amail.club" into element with xpath "//input[@formcontrolname='email']"
    And I type "@#%#%#@%^*" into element with xpath "//input[@formcontrolname='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And Revert to back "Password" old "@#%#%#@%^*" new1 "0123456789"

  @Area_of_independent_testing
  Scenario: Verify user can create password use whitespace input
    When I click on element with xpath "//h5[contains(text(),'Setting')]"
    And I click on element with xpath "//span[contains(text(),'Change Your Password')]"
    And I type "@#%#%#@%^*" into element with xpath "//input[@placeholder='Password']"
    And I type "@#%#%#@%^ *" into element with xpath "//input[@placeholder='New Password']"
    And I type "@#%#%#@%^ *" into element with xpath "//input[@placeholder='Confirm New Password']"
    And I click on element with xpath "(//button[@aria-label])[2]"
    Then element with xpath "//*[contains(text(),'Whitespaces are not allowed')]" should be disabled
