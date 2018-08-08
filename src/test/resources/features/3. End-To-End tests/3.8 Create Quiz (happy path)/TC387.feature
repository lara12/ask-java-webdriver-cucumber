@TC38
Feature: Create Quiz
  Background: Login into account
    Given I Login


  @3.End-To-End_tests
  Scenario Outline: Teacher can create Quiz with Textual question + Multiple-choice question + Ohter

    When Page title is "Assessment Control @ Portnov"
    And Create Quiz with Textual question. Title "<Quiz>"
    And Add question
    And I choose type of question as Textual
    And I type "<Question>"
#=======================================================================
    And Add question
    And I choose type of question as "Multiple-Choice"
    And I wait for 3 sec
    And I type second question "<Question>"

    And I type to Option 1
    And i choose correct answer in Multiple-Choice. Option 1
    Then I check correct answer 1 is selected

    And I type to Option 2

    And I add option
    And I type to Option 3
    And i choose correct answer in Multiple-Choice. Option 3
    Then I check correct answer 3 is selected

    And I add option
    And I type to Option 4
    And i choose correct answer in Multiple-Choice. Option 4
    Then I check correct answer 4 is selected

    And I click Other
    And I save Quiz

    Then I verify that Quiz "<Quiz>" was created
    Then I verify that "<Quiz>" is unique
    Then Quiz "<Quiz>" has 2 questions
    Then Quiz "<Quiz>" has Maximum possible score = 10
    Then Quiz "<Quiz>" has Passing Percentage = 75
    Then Quiz "<Quiz>" has Created At date
    Then Quiz "<Quiz>" has Updated At date

            ##   I delete test document
    And I Delete "<Quiz>"
    Then Quiz "<Quiz>" should not be presented

    Examples:
      |Quiz                                             |Question        |
      |(1 Quiz with Textual + Multiple-choice questions | Question       |
