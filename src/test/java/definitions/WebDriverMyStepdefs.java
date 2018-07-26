package definitions;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import org.openqa.selenium.logging.LogEntries;
import org.openqa.selenium.logging.LogEntry;
import support.TestContext;
import static support.TestContext.getDriver;

public class WebDriverMyStepdefs {
    @Given("^I go to the \"([^\"]*)\" page and print details$")
    public void iGoToThePageAndPrintDetails(String page) throws Throwable {
        getDriver().get(page);

        System.out.println(getDriver().getCurrentUrl());
        System.out.println(getDriver().getTitle());
        System.out.println(getDriver().getWindowHandle());

    }

    @And("^I go back and forward and refresh the page$")
    public void iGoBackAndForwardAndRefreshThePage() throws Throwable {
       getDriver().navigate().back();
       getDriver().navigate().forward();
       getDriver().navigate().refresh();
    }

    @And("^I print logs to console$")
    public void iPrintLogsToConsole() throws Throwable {
       LogEntries logEntries = getDriver().manage().logs().get("browser");
        for(LogEntry element : logEntries){
            System.out.println();
            System.out.println(element);

        }
    }
}
