##############################     byIgor


Feature: Convert to student (by teacher)
@ACA-515 @3.7 @3End-To-End-tests
    Scenario: Convert to student (by teacher) cucumber
       Given I open url "http://local.school.portnov.com:4520/#/login"
       Then I wait for element with xpath "//h3[contains(text(),'Assessment Control')]" to be present
       When I type "hilurih@shinnemo.com" into element with xpath "//*[@formcontrolname='email']"
       And I type "12345" into element with xpath "//*[@formcontrolname='password']"
       And I click on element with xpath "//button//*[contains(text(),'Sign In')]"
       Then I wait for element with xpath "//*[contains(text(),'Management')]/../..//*[contains(text(),'group')]" to be present
       When I click on element using JavaScript with xpath "//*[contains(text(),'Management')]/../..//*[contains(text(),'group')]"
       Then I wait for element with xpath "//*[contains(text(),'Teachers')]" to be present
       When I click on element using JavaScript with xpath "//*[contains(text(),'Teachers')]"
       Then I wait for element with xpath "//*[contains(text(),'Olga Mix')]" to be present
       When I click on element using JavaScript with xpath "//*[contains(text(),'Olga Mix')]"
       Then I wait for element with xpath "//button//*[contains(text(),'settings')]" to be present
       When I click on element using JavaScript with xpath "//button//*[contains(text(),'settings')]"
       Then I wait for element with xpath "//button//*[contains(text(),'school')]" to be present
       When I click on element using JavaScript with xpath "//button//*[contains(text(),'school')]"
       Then I wait for element with xpath "//button//*[contains(text(),'Change Role')]" to be present
       When I click on element with xpath "//button//*[contains(text(),'Change Role')]"
       Then I wait for element with xpath "//*[contains(text(),'User Role')]/..//*[contains(text(),'STUDENT')]" to be present
#         clean up
         When I click on element using JavaScript with xpath "//button//*[contains(text(),'settings')]"
         Then I wait for element with xpath "//button//*[contains(text(),'school')]" to be present
         When I click on element using JavaScript with xpath "//button//*[contains(text(),'school')]"
         Then I wait for element with xpath "//button//*[contains(text(),'Change Role')]" to be present
         When I click on element with xpath "//button//*[contains(text(),'Change Role')]"
         Then I wait for element with xpath "//*[contains(text(),'User Role')]/..//*[contains(text(),'TEACHER')]" to be present
       #done