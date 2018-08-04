package definitions;

import cucumber.api.PendingException;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import support.TestContext;

public class LoginStepsDef {
    @When("^I login whith valid user \"([^\"]*)\" and password \"([^\"]*)\"$")
    public void iLoginWhithValidUserAndPassword(String username, String password) throws Throwable {
        TestContext.getDriver().findElement(By.xpath("//input[@id='mat-input-0']")).sendKeys(username);
        TestContext.getDriver().findElement(By.xpath("//input[@id='mat-input-1']")).sendKeys(password);
        Thread.sleep(2000);
        TestContext.getDriver().findElement(By.xpath("//span[contains(text(),'Sign In')]")).click();
    }
}
