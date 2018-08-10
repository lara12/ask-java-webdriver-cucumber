package definitions;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static support.TestContext.getDriver;

public class ExtraStepsByIgor {
    public static String assignedTo = "";
    public static String SubmittedTime = "";

    @And("^I click and remember as assignedTo on element using JavaScript with xpath \"([^\"]*)\"$")
    public void iClickAndRememberAsUserOnElementUsingJavaScriptWithXpath(String xpath) {
        WebElement element = getDriver().findElement(By.xpath(xpath));
        assignedTo = element.getText();
        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        executor.executeScript("arguments[0].click();", element);
    }

    @Then("^element with xpath \"([^\"]*)\" has the same name of student$")
    public void elementWithXpathShouldHaveTextAs(String xpath) {
        String actualText = getDriver().findElement(By.xpath(xpath)).getText();
        assertThat(actualText).isEqualTo(assignedTo);
    }


    @Then("^I compare the submitted time as SubmittedTime and time from xpath \"([^\"]*)\"$")
    public void iCompareTheSubmittedTimeAsAssignedToAndTimeFromXpath(String xpath) throws Throwable {
        String actualText = getDriver().findElement(By.xpath(xpath)).getText();
        assertThat(actualText).isEqualTo(SubmittedTime);

    }

    @Then("^I click and remember as SubmittedTime on element using JavaScript with xpath \"([^\"]*)\"$")
    public void iClickAndRememberAsSubmittedTimeOnElementUsingJavaScriptWithXpath(String xpath) throws Throwable {
        WebElement element = getDriver().findElement(By.xpath(xpath));
        SubmittedTime = element.getText();
        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        executor.executeScript("arguments[0].click();", element);


    }
}

