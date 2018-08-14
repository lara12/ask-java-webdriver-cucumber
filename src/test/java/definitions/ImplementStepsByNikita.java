//package definitions;
//
//import cucumber.api.java.en.And;
//import cucumber.api.java.en.Then;
//import cucumber.api.java.en.When;
//
//public interface ImplementStepsByNikita {
//
//    @Then("^I click on element with xpath \"([^\"]*)\" 2$")
//    public void iClickOnElementWithXpath(String xpath);
//
//    @And("^I click on element \"([^\"]*)\" using JavaScript$")
//    public void revertToBackOldNew1(String user);
//
//    @Then("^I scroll to the element with xpath \"([^\"]*)\"$")
//    public void iScrollToTheElementWithXpath(String xpath);
//
//    @When("^I type \"([^\"]*)\" into element with xpath \"([^\"]*)\" 2$")
//    public void iTypeIntoElementWithXpath(String text, String xpath);
//
//    @And("^I input value with length (-?\\d+) on field with xpath \"([^\"]*)\" which include digits alphabet and special characters$")
//    public void iInputValueWithLengthOnFieldWithXpath(int length, String xpath);
//
//    @Then("^I input value with length (\\d+) on field with xpath \"([^\"]*)\" which include digits$")
//    public void iInputValueWithLengthOnFieldWithXpathWhichIncludeDigits(int length, String xpath);
//
//    @Then("^I input value with length (\\d+) on field with xpath \"([^\"]*)\" which include alphabet$")
//    public void iInputValueWithLengthOnFieldWithXpathWhichIncludeAlphabet(int length, String xpath);
//
//    @Then("^I verify that required text \"([^\"]*)\" and text with xpath \"([^\"]*)\" is equal$")
//    public void iValidateThatTextAndTextWithXpathIsEqual(String xpath, String text);
//
//    @Then("^I verify that text with xpath \"([^\"]*)\" is displayed")
//    public void verifyError(String xpath);
//
//    @Then("^I verify that got value from the field with xpath \"([^\"]*)\" is equal to \"([^\"]*)\"$")
//    public void iTryGetValueFromTheFieldWithXpath(String xpath, String requiredValue);
//
//    @Then("^element with xpath \"([^\"]*)\" should be displayed no delete \"([^\"]*)\" as \"([^\"]*)\" with \"([^\"]*)\" credentials$")
//    public void elementWithXpathShouldBeDisplayedNoDelete(String xpath, String name, String userrule, String credentials) throws InterruptedException;
//
//    @And("^Revert to back \"([^\"]*)\" old \"([^\"]*)\" new1 \"([^\"]*)\"$")
//    public void revertToBackOldNew(String object, String old, String new1) throws Exception;
//
//    @Then("^I delete user \"([^\"]*)\" which is a \"([^\"]*)\" with \"([^\"]*)\" credentials other user$")
//    public void iDeleteUserWhichIsATeacher(String lastname, String userrule, String credentials);
//
//    @When("^login as teacher username \"([^\"]*)\" password \"([^\"]*)\"$")
//    public void loginAsTeacherUsernamePassword(String username, String password);
//}
