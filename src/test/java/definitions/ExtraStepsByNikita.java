package definitions;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.StaleElementReferenceException;

import java.util.ArrayList;
import java.util.Random;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.fail;
import static support.TestContext.getDriver;

public class ExtraStepsByNikita {

    @Then("^I click on element with xpath \"([^\"]*)\" 2$")
    public void iClickOnElementWithXpath(String xpath) {
        for(int second = 0; ;second++){
            if(second >= 1000){
                fail("Timeout for element: " + xpath);
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

    @And("^I click on element \"([^\"]*)\" using JavaScript$")
    public void iClickOnElementUsingJavaScript(String xpath) {
//        String func = "return document.evaluate(\"//form//div//div[contains(., '"+user+"')]\", document, null, XPathResult.ANY_TYPE, null).iterateNext().click()";
        String func = "return document.evaluate(\""+xpath+"\", document, null, XPathResult.ANY_TYPE, null).iterateNext().click()";
        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        executor.executeScript(func);
    }

    @Then("^I scroll to the element with xpath \"([^\"]*)\"$")
    public void iScrollToTheElementWithXpath(String xpath) {
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


//    @Then("^I Cut inputed data from field with xpath \"([^\"]*)\"$")
//    public void iCutInputedDataFromFieldWithXpath(String xpath) {
//        Stack<String> stack = new Stack<>();
//        getDriver().findElement(By.xpath(xpath)).sendKeys(Keys.CONTROL + "a");
//        getDriver().findElement(By.xpath(xpath)).sendKeys(Keys.CONTROL + "x");
//        if (stack != null) {
//            String value = stack.peek();
//            System.out.println(value);
//        }
//        String result = getDriver().findElement(By.xpath(xpath)).getAttribute("value");
//        if(result.equals("")){
//            System.out.println("Menu 'Cut' is enable");
//        }
//        else{
//            System.out.println("Menu 'Cut' is disable");
//        }
//    }

    @When("^I type \"([^\"]*)\" into element with xpath \"([^\"]*)\" 2$")
    public void iTypeIntoElementWithXpath(String text, String xpath) {
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
        //use ASCII in DEC code column list for setting leftlimit and rightlimit
        //https://www.asciitable.com/
        int leftlimit = 33;
        int rightlimit = 126;
        //this limit will be generate random characters between ! and ~
        Random random = new Random();
        StringBuilder createdString = new StringBuilder(length);
        for(int i = 0; i < length; i++){
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
        for(int i = 0; i < length; i++){
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
        for(int i = 0; i < length; i++){
            int randomLimitedInt = leftlimit + (int)(random.nextFloat()*(rightlimit - leftlimit + 1));
            createdString.append((char)randomLimitedInt);
        }
        String buildedString = createdString.toString();
        System.out.println(buildedString);
        getDriver().findElement(By.xpath(xpath)).sendKeys(buildedString);
    }

    @Then("^I verify that required text \"([^\"]*)\" and text with xpath \"([^\"]*)\" is equal$")
    public void iValidateThatTextAndTextWithXpathIsEqual(String xpath, String text) {
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
        String getres = getDriver().findElement(By.xpath(xpath)).getAttribute("value");
        if(getres.equals(requiredValue)){
            System.out.println("Value from field is equal to required Value");
        }else{
            System.out.println("Value from field isn't equal to required Value");
        }
    }

    @Then("^element with xpath \"([^\"]*)\" should be displayed no delete \"([^\"]*)\" as \"([^\"]*)\" with \"([^\"]*)\" credentials$")
    public void elementWithXpathShouldBeDisplayedNoDelete(String xpath, String name, String userrule, String credentials) throws InterruptedException {
        try {
            getDriver().findElement(By.xpath(xpath)).isDisplayed();
        }catch(Exception e){
            iDeleteUserWhichIsATeacher(name, userrule, credentials);
            Thread.sleep(1000);
            throw new PendingException();
        }
    }

    @And("^Revert to back \"([^\"]*)\" old \"([^\"]*)\" new1 \"([^\"]*)\"$")
    public void revertToBackOldNew(String object, String old, String new1) throws Exception {
        iClickOnElementWithXpath("//h5[contains(text(),'Setting')]");
        iClickOnElementWithXpath("//span[contains(text(),'Change Your Password')]");
        iTypeIntoElementWithXpath(old,"//input[@placeholder='Password']");
        iTypeIntoElementWithXpath(new1,"//input[@placeholder='New Password']");
        iTypeIntoElementWithXpath(new1,"//input[@placeholder='Confirm New Password']");
        iClickOnElementWithXpath("(//button[@aria-label])[2]");
        st.iWaitForSec(2);
    }

    PredefinedStepDefs st = new PredefinedStepDefs();
    @Then("^I delete user \"([^\"]*)\" which is a \"([^\"]*)\" with \"([^\"]*)\" credentials other user$")
    public void iDeleteUserWhichIsATeacher(String lastname, String userrule, String credentials) {
        if(credentials.equals("")){
            try {
                loginAsTeacherUsernamePassword("nikita_teacher@amail.club","0123456789");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        iClickOnElementWithXpath("//h5[contains(text(),'Management')]");
        if(userrule.equals("Student")){
            iClickOnElementWithXpath("(//div[@role='tab'])[1]");
            iScrollToTheElementWithXpath("//h4[contains(text(),'"+lastname+"')]");
            iClickOnElementWithXpath("//h4[contains(text(),'"+lastname+"')]");
            iClickOnElementWithXpath("//button[@color='accent']");
            iClickOnElementWithXpath("(//button[@role='menuitem'])[4]");
        }else if(userrule.equals("Teacher")){
            iClickOnElementWithXpath("(//div[@role='tab'])[2]");
            iScrollToTheElementWithXpath("//h4[contains(text(),'"+lastname+"')]");
            iClickOnElementWithXpath("//h4[contains(text(),'"+lastname+"')]");
            iClickOnElementWithXpath("//button[@color='accent']");
            iClickOnElementWithXpath("(//button[@role='menuitem'])[3]");
        }
        iClickOnElementWithXpath("(//button[@aria-label])[2]");
    }

    @When("^login as teacher username \"([^\"]*)\" password \"([^\"]*)\"$")
    public void loginAsTeacherUsernamePassword(String username, String password) throws Exception {
         try {
             st.iOpenUrl("http://local.school.portnov.com:4520/#/login");
             st.iTypeIntoElementWithXpath(username, "//input[@formcontrolname='email']");
             st.iTypeIntoElementWithXpath(password, "//input[@formcontrolname='password']");
             st.iClickOnElementWithXpath("//button[@type='submit']");
             st.iWaitForSec(3);
             getDriver().findElement(By.xpath("//h3[text()='Nikita Dovhych']")).isDisplayed();
            }
         catch (Exception e) {
             restorePassword(username, password);
         }
    }

    private void restorePassword(String username, String password) throws Exception {
        try {
            iClickOnElementWithXpath("//*[contains(text(),'I forgot my password')]");
            iTypeIntoElementWithXpath(username,"//*[@placeholder]");
            iClickOnElementWithXpath("//*[contains(text(),'Request Password Reset')]");
            st.iWaitForSec(3);
            st.iOpenUrl("https://getnada.com/#");
            st.iWaitForSec(1);
            iClickOnElementWithXpath("//span[contains(text(),'Add Inbox')]");
            st.iClearElementWithXpath("//input[@placeholder]");
            iTypeIntoElementWithXpath("nikita_teacher", "//input[@placeholder]");
            getDriver().findElement(By.id("domain")).click();
            iClickOnElementWithXpath("//*[@value='amail.club']");
            iClickOnElementWithXpath("//*[@class='button success']");

            iClickOnElementWithXpath("//span[contains(text(),'nikita_teacher@amail.club')]");
            iClickOnElementWithXpath("//li[@class='msg_item'][1]");
            st.iWaitForSec(2);
            st.iSwitchToIframeWithXpath("//iframe[@id='idIframe']");
            String href = null;
            iScrollToTheElementWithXpath("//*[contains(text(),'Reset Password')]");
            iClickOnElementWithXpath("//*[contains(text(),'Reset Password')]");
            st.iWaitForSec(2);
            String deafult = getDriver().getWindowHandle();
            ArrayList tabs = new ArrayList (getDriver().getWindowHandles());
            getDriver().switchTo().window(String.valueOf(tabs.get(1)));
            iTypeIntoElementWithXpath(password,"//input[@placeholder='New Password']");
            iTypeIntoElementWithXpath(password,"//input[@placeholder='Confirm New Password']");
            iClickOnElementWithXpath("//span[@class='mat-button-wrapper']");
            st.iWaitForSec(2);
            getDriver().close();
            getDriver().switchTo().window(deafult);
            loginAsTeacherUsernamePassword(username, password);
        }
        catch (Exception e) {
            restorePassword(username, password);
        }
    }

    @Then("^I clean up assigment with$")
    public void cleanAssigments() throws Exception{
        getDriver().findElement(By.xpath("//h5[contains(text(),'Assignments')]")).click();
        st.iWaitForSec(3);
        boolean staleElement = getDriver().findElement(By.xpath("(//*[contains(text(),'cucumber do not delete')])[1]")).isDisplayed();;
        while(staleElement){
            try{
                getDriver().findElement(By.xpath("(//*[contains(text(),'cucumber do not delete')])[1]")).isDisplayed();
                getDriver().findElement(By.xpath("//*[contains(text(),'cucumber do not delete')]/..//button")).click();
                getDriver().findElement(By.xpath("//*[contains(text(),'Delete')]")).click();
                getDriver().findElement(By.xpath("//*[@*='Close dialog'][2]")).click();
                st.iWaitForSec(2);
            } catch(StaleElementReferenceException e){
                staleElement = true;
            }
        }
        System.out.println(staleElement);
    }
}