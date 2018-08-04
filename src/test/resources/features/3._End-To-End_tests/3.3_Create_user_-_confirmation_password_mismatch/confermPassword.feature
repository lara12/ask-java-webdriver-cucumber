Feature: Create user - confirmation password mismatch,  cucumber
  Background: Open registration page
    Given  I open registration page

  Scenario: User shouldn`t get error message if confirm password match with password
    And I type "12346" into "Password"
    And I type "12346" into "Confirm Password"
    Then I shouldn`t see error message


  Scenario: User get error message if confirm password mismatch with password
    And I type "12346" into "Password"
    And I type "12345" into "Confirm Password"
    Then I should see error message