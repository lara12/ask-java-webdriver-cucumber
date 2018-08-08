@TC38
Feature: Create Quiz
  Background: Login into account
    Given I Login

  @3.End-To-End_tests
  Scenario Outline: Teacher can create Quiz with one Textual question

    When Page title is "Assessment Control @ Portnov"
    And Create Quiz with Textual question. Title "<Quiz>"
    And Add question
    And I choose type of question as Textual
    And I type "<Question>"
    When I save Quiz
    Then I verify that Quiz "<Quiz>" was created
    Then Quiz "<Quiz>" has 1 questions
    Then Quiz "<Quiz>" has Maximum possible score = 5
    Then Quiz "<Quiz>" has Passing Percentage = 75
    Then Quiz "<Quiz>" has Created At date
    Then Quiz "<Quiz>" has Updated At date
    Then I verify that "<Quiz>" is unique
      ##   I delete test document
    And I Delete "<Quiz>"
    Then Quiz "<Quiz>" should not be presented

    Examples:
      |Quiz                          | Question       |
      |(1 Quiz with textual question |Textual question|