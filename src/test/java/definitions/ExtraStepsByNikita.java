package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import java.util.Random;

import static org.assertj.core.api.Assertions.fail;
import static support.TestContext.getDriver;

public class ExtraStepsByNikita {
    @Then("^I click on element with xpath \"([^\"]*)\" 2$")
    public static void iClickOnElementWithXpath(String xpath) {
        for(int second = 0; ;second++){
            if(second >= 1000){
                fail("Timeout for element" + xpath);
            }
            try{
                if(getDriver().findElement(By.xpath(xpath)).isDisplayed()){
                    getDriver().findElement(By.xpath(xpath)).click();
                    break;
                }
            }
            catch(Exception e){}
        }
    }

    @Then("^I scroll to the element with xpath \"([^\"]*)\"$")
    public static void iScrollToTheElementWithXpath(String xpath) {
        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        for(int second = 0; ;second++){
            if(second >= 1000){
                fail("Timeout for element" + xpath);
            }
            try{
                executor.executeScript("arguments[0].scrollIntoView(true);", getDriver().findElement(By.xpath(xpath)));
                if(getDriver().findElement(By.xpath(xpath)).isDisplayed()){
                    break;
                }
            }
            catch(Exception e){}
        }
    }


    @Then("^I Cut inputed data from field with xpath \"([^\"]*)\"$")
    public static void iCutInputedDataFromFieldWithXpath(String xpath) {
        //created by Nikitos (copyright enable)
        getDriver().findElement(By.xpath(xpath)).sendKeys(Keys.CONTROL + "a");
        String result = getDriver().findElement(By.xpath(xpath)).getAttribute("value");
        if(result.equals("")){
            System.out.println("Menu 'Cut' is enable");
        }
        else{
            System.out.println("Menu 'Cut' is disable");
        }
    }

    @When("^I type \"([^\"]*)\" into element with xpath \"([^\"]*)\" 2$")
    public static void iTypeIntoElementWithXpath(String text, String xpath) {
        for(int second = 0; ;second++){
            if(second >= 1000){
                fail("Timeout for element" + xpath);
            }
            try{
                if(getDriver().findElement(By.xpath(xpath)).isDisplayed()){
                    getDriver().findElement(By.xpath(xpath)).sendKeys(text);
                    break;
                }
            }
            catch(Exception e){}
        }
    }

    @And("^I input value with length (-?\\d+) on field with xpath \"([^\"]*)\" which include digits alphabet and special characters$")
    public void iInputValueWithLengthOnFieldWithXpath(int length, String xpath) {
        //created by Nikitos (copyright enable)
        //use ASCII in DEC code column list for setting leftlimit and rightlimit
        //https://www.asciitable.com/
        int leftlimit = 33;
        int rightlimit = 126;
        //this limit will be generate random characters between ! and ~
        Random random = new Random();
        StringBuilder createdString = new StringBuilder(length);
        for(int i = 0; i <= length; i++){
            int randomLimitedInt = leftlimit + (int)(random.nextFloat()*(rightlimit - leftlimit + 1));
            createdString.append((char)randomLimitedInt);
        }
        String buildedString = createdString.toString();
        System.out.println(buildedString);
        getDriver().findElement(By.xpath(xpath)).sendKeys(buildedString);
    }

    @Then("^I input value with length (\\d+) on field with xpath \"([^\"]*)\" which include digits$")
    public void iInputValueWithLengthOnFieldWithXpathWhichIncludeDigits(int length, String xpath) {
        int leftlimit = 48;
        int rightlimit = 57;
        Random random = new Random();
        StringBuilder createdString = new StringBuilder(length);
        for(int i = 0; i <= length; i++){
            int randomLimitedInt = leftlimit + (int)(random.nextFloat()*(rightlimit - leftlimit + 1));
            createdString.append((char)randomLimitedInt);
        }
        String buildedString = createdString.toString();
        System.out.println(buildedString);
        getDriver().findElement(By.xpath(xpath)).sendKeys(buildedString);
    }

    @Then("^I input value with length (\\d+) on field with xpath \"([^\"]*)\" which include alphabet$")
    public void iInputValueWithLengthOnFieldWithXpathWhichIncludeAlphabet(int length, String xpath) {
        int leftlimit = 65;
        int rightlimit = 90;
        Random random = new Random();
        StringBuilder createdString = new StringBuilder(length);
        for(int i = 0; i <= length; i++){
            int randomLimitedInt = leftlimit + (int)(random.nextFloat()*(rightlimit - leftlimit + 1));
            createdString.append((char)randomLimitedInt);
        }
        String buildedString = createdString.toString();
        System.out.println(buildedString);
        getDriver().findElement(By.xpath(xpath)).sendKeys(buildedString);
    }

    @Then("^Delete student \"([^\"]*)\"$")
    public void deleteStudent(String xpath) {
        iClickOnElementWithXpath("//*[contains(text(),'Management')]");
        iScrollToTheElementWithXpath(xpath);
        iClickOnElementWithXpath("//button[@color='accent']");
        iClickOnElementWithXpath("//button[@role='menuitem']/..//*[contains(text(),'delete')]");
        iClickOnElementWithXpath("//*[contains(text(),'Delete')]");
    }

    @Then("^I verify that required text \"([^\"]*)\" and text with xpath \"([^\"]*)\" is equal$")
    public void iValidateThatTextAndTextWithXpathIsEqual(String xpath, String text) {
        //created by Nikitos (copyright enable)
        try{
            boolean equal = getDriver().findElement(By.xpath(xpath)).getText().equals(text);
            System.out.println(getDriver().findElement(By.xpath(xpath)).getText());
            String equal2 = getDriver().findElement(By.xpath(xpath)).getText();
            System.out.println(equal2);
            if (equal){
                System.out.println("Text with xpath " + xpath + " is equals to" + text);
            }
        }
        catch(Exception e){
        }
    }

    @Then("^I verify that text with xpath \"([^\"]*)\" is displayed")
    public void verifyError(String xpath){
        //created by Nikitos (copyright enable)
        try{
            boolean error = getDriver().findElement(By.xpath(xpath)).isDisplayed();
            if (error){
                System.out.println("Error is displayed");
            }
        }
        catch(Exception e){
        }
    }

    @Then("^I verify that got value from the field with xpath \"([^\"]*)\" is equal to \"([^\"]*)\"$")
    public void iTryGetValueFromTheFieldWithXpath(String xpath, String requiredValue) {
        //created by Nikitos (copyright enable)
        String getres = getDriver().findElement(By.xpath(xpath)).getAttribute("value");
        if(getres.equals(requiredValue)){
            System.out.println("Value from field is equal to required Value");
        }else{
            System.out.println("Value from field isn't equal to required Value");
        }
    }

}
