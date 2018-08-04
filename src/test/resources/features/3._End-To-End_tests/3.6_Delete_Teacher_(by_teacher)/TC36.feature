@ACA512
Feature: Teacher can delete other teacher
  @TC36
  Scenario Outline: Delete teacher


    Given I Login
    Then I navigate to "User's Management" page
    Then I wait for 3 sec
    Then I choose tab "Teachers"
    Then I delete Teacher with name "<data>"

    Examples:
      | data |
      | Tech Teach|