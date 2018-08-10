Feature: Create Quiz with Show-stoper questions

@3.End-to-end-tests @3.8.4
Scenario: Quiz with Textual question + Show Stopper
Given I open url "http://local.school.portnov.com:4520/#/login"
Then I should see page title contains "Assessment Control @ Portnov"
And element with xpath "//*[@placeholder='Email *']" should be present
When I type "hilurih@shinnemo.com" into element with xpath "//*[@placeholder='Email *']"
Then element with xpath "//*[@placeholder='Password *']" should be present
When I type "12345" into element with xpath "//*[@placeholder='Password *']"
And  I click on element using JavaScript with xpath "//span[contains(text(),'Sign In')]"
Then I wait for element with xpath "//*[@class='mat-line'][contains(text(),'Quizzes')]" to be present
When I click on element using JavaScript with xpath "//*[@class='mat-line'][contains(text(),'Quizzes')]"
Then I wait for element with xpath "//span[@class='mat-button-wrapper'][contains(text(),'Create New Quiz')]" to be present
When I click on element using JavaScript with xpath "//span[@class='mat-button-wrapper'][contains(text(),'Create New Quiz')]"
Then I wait for element with xpath "//*[@formcontrolname='name']" to be present
When I type "Text+Stopper test2" into element with xpath "//*[@formcontrolname='name']"
And I click on element using JavaScript with xpath "//div[@class='controls ng-star-inserted']//button[@color='primary']"
And I click on element using JavaScript with xpath "//*[contains(text(),'Textual')]/../..//*[contains(@id,'radio')]"
And I type "12345" into element with xpath "//*[@formcontrolname='question']"
And I click on element using JavaScript with xpath "//button//*[contains(text(),'Save')]"
Then I wait for element with xpath "//*[@class='quizzes']" to be present
And element with xpath "//*[contains(text(),'Text+Stopper test2')]" should be present
#        Clean up
* I click on element using JavaScript with xpath "//*[contains(text(),'Text+Stopper test2')]"
* element with xpath "//*[contains(text(),'Text+Stopper test2')]/../../..//*[contains(text(),'Delete')]" should be present
* I click on element with xpath "//*[contains(text(),'Text+Stopper test2')]/../../..//*[contains(text(),'Delete')]"
* element with xpath "//*[contains(text(),'want to DELETE whole')]/../..//*[contains(text(),'Delete')]" should be present
* I click on element with xpath "//*[contains(text(),'want to DELETE whole')]/../..//*[contains(text(),'Delete')]"
* I wait for 2 sec
* element with xpath "//*[contains(text(),'Text+Stopper test2')]" should not be present
#        done