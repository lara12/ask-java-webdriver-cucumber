@TC38
Feature: Create Quiz
  Background: Login into account
    Given I Login


  @TC386
  Scenario Outline: Teacher can create Quiz with Multiple-choice question + Ohter

    Then Page title is "Assessment Control @ Portnov"
    When Create Quiz with Multiple-choice question. Title "<Quiz>"
    And Add question
    And I choose type of question as "Multiple-Choice"
    And I type "<Question>"

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
    Then Quiz "<Quiz>" has 1 questions
    Then Quiz "<Quiz>" has Maximum possible score = 5
    Then Quiz "<Quiz>" has Passing Percentage = 75
    Then Quiz "<Quiz>" has Created At date
    Then Quiz "<Quiz>" has Updated At date

            ##   I delete test document
    And I Delete "<Quiz>"
    Then Quiz "<Quiz>" should not be presented

    Examples:
      |Quiz                                  |Question        |
      |(1 Quiz with Multiple-choice question | Question       |

