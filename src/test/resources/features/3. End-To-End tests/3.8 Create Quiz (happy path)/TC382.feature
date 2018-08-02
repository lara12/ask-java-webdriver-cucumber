@TC38
Feature: Create Quiz
  Background: Login into account
    Given I Login

  @TC382
  Scenario Outline: Teacher can create Quiz with Single-choice question

    Then Page title is "Assessment Control @ Portnov"
    When Create Quiz with Single-choice question. Title "<Quiz>"
    And Add question
    And I choose type of question as "Single-Choice"
    And I type "Single-choice question"
    And I type to Option 1
    And I type to Option 2
    And i choose correct answer. Option 2
    And I save Quiz
    Then I verify that Quiz "<Quiz>" was created
    Then I verify that "<Quiz>" is unique
    Then Quiz "<Quiz>" has 1 questions
    Then Quiz "<Quiz>" has Maximum possible score = 5
    Then Quiz "<Quiz>" has Passing Percentage = 75
    Then Quiz "<Quiz>" has Created At date
    Then Quiz "<Quiz>" has Updated At date
        #   I delete test document
    And I Delete "<Quiz>"
    Then Quiz "<Quiz>" should not be presented

    Examples:
      |Quiz                                |
      |(1 Quiz with Single-choice question |