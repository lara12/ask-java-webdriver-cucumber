// Created by Viacheslav (Slava) Skryabin 04/01/2018
package definitions;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import okhttp3.*;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;


public class Quiz_methods {
    private PredefinedStepDefs step = new PredefinedStepDefs();

    //    public class WaitElement {
    private void iWaitForElement(String xpath) {
        new WebDriverWait(getDriver(), 180, 200).
                until(ExpectedConditions.presenceOfElementLocated(By.xpath(xpath)));
    }




    @When("^I type to Option (\\d+)$")
    public void iTypeIntoElementWithXpath(int arg0) throws InterruptedException {
        String xpath = "//textarea[@placeholder='Option "+arg0+"*']";
        iWaitForElement(xpath);
        getDriver().findElement(By.xpath(xpath)).clear();
        getDriver().findElement(By.xpath(xpath)).sendKeys("Option "+arg0);
    }




    @Then("^I add option$")
    public void addOption() throws Throwable {
        getDriver().findElement(By.xpath("//*[@class='add-option']/button")).click();
    }

    @Then("^I choose correct answer. Option (\\d+)$")
    public void iChooseCorrectAnswer(int option) throws Throwable {
        String xpath ="(//textarea[@placeholder='Option "+option+"*'])//ancestor::div/mat-checkbox";
        getDriver().findElement(By.xpath(xpath)).click();
    }


    @Then("^I check correct answer (\\d+) is selected$")
    public void iCheckCorrectAnswerIsSelected(String option) throws Throwable {
//        (//textarea[@placeholder='Option 1*'])//ancestor::div/mat-checkbox//input

        String xpath ="(//textarea[@placeholder='Option "+option+"*'])//ancestor::div/mat-checkbox//input";
        System.out.println(" is selected " + getDriver().findElement(By.xpath(xpath)).isSelected());
        System.out.println(" getAttribute " + getDriver().findElement(By.xpath(xpath)).getAttribute("aria-checked"));
    }

    @Then("^I type (\\d+) \"([^\"]*)\" with xpath \"([^\"]*)\"$")
    public void iTypeOptionInXpath(int arg0, String text, String xpath) throws Throwable {
        getDriver().findElement(By.xpath(xpath)).sendKeys(text);
    }

    @Then("^I save Quiz$")
    public void iSaveQuiz() throws InterruptedException {
        String xpath = "//button/span[contains(text(), 'Save')]//..";
        getDriver().findElement(By.xpath("//button/span[contains(text(), 'Save')]//..")).click();
    }



//    @Then("^I click on element with xpath \"([^\"]*)\"$")
//    public void iClickOnElement(String xpath) throws Exception {
//        iWaitForElement(xpath);
//        WebElement element = getDriver().findElement(By.xpath(xpath));
//        element.click();
//    }










    // -------------------------- My script --------------------------------------
    @Then("^Quiz \"([^\"]*)\" has Passing Percentage = (\\d+)$")
    public void iVerifyThatQuizHasPassingPercentage(String arg0, int arg1) throws Throwable {
        getDriver().findElement(By.xpath("//h5[text()='Quizzes']")).click();
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");
        String quiz = "(//*[contains(text(),'" + arg0 + "')]//ancestor::mat-expansion-panel)[1]";

        WebElement element = getDriver().findElement(By.xpath(quiz));
        element.click();
        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        executor.executeScript("arguments[0].scrollIntoView(true);", element);

        String xpath2 = "(//*[contains(text(),'" + arg0 + "')]//ancestor::mat-expansion-panel)[1]//descendant::tr[3]/td[2]";

        int number = Integer.parseInt(getDriver().findElement(By.xpath(xpath2)).getText());
        System.out.println("\nPassing Percentage " + number);

        assertThat(arg1).isEqualTo(number);
    }

    @Then("^Quiz \"([^\"]*)\" has Created At date$")
    public void iVerifyThatQuizHasCreatedDate(String arg0) throws Throwable {
        getDriver().findElement(By.xpath("//h5[text()='Quizzes']")).click();
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");
        String quiz = "(//*[contains(text(),'" + arg0 + "')]//ancestor::mat-expansion-panel)[1]";

        WebElement element = getDriver().findElement(By.xpath(quiz));
        element.click();
        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        executor.executeScript("arguments[0].scrollIntoView(true);", element);

        String xpath2 = "(//*[contains(text(),'" + arg0 + "')]//ancestor::mat-expansion-panel)[1]//descendant::tr[4]/td[2]";

        String date = getDriver().findElement(By.xpath(xpath2)).getText();
        System.out.println("\nCreated " + date);
    }

    @Then("^Quiz \"([^\"]*)\" has Updated At date$")
    public void iVerifyThatQuizHasUpdatedDate(String arg0) throws Throwable {
        getDriver().findElement(By.xpath("//h5[text()='Quizzes']")).click();
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");
        String quiz = "(//*[contains(text(),'" + arg0 + "')]//ancestor::mat-expansion-panel)[1]";

        WebElement element = getDriver().findElement(By.xpath(quiz));
        element.click();
        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        executor.executeScript("arguments[0].scrollIntoView(true);", element);

        String xpath2 = "(//*[contains(text(),'" + arg0 + "')]//ancestor::mat-expansion-panel)[1]//descendant::tr[5]/td[2]";

        String data = getDriver().findElement(By.xpath(xpath2)).getText();
        System.out.println("\nUpdated " + data);
    }




    @Then("^Open List of Quizzes$")
    public void openListOfQuizzes() throws Throwable {
        getDriver().findElement(By.xpath("//h5[text()='Quizzes']")).click();
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");
    }


    @Given("^I Login$")
    public void userLogin() throws Throwable {
        step.iWaitForSec(15);
        getDriver().get("http://ask-stage.portnov.com/#/login");
        iWaitForElement("//input[@id='mat-input-0']");
        WebElement login = getDriver().findElement(By.xpath("//input[@id='mat-input-0']"));

        login.clear();
        login.sendKeys("yitenises@shinnemo.com");

        WebElement password = getDriver().findElement(By.xpath("//input[@id='mat-input-1']"));
        password.clear();
        password.sendKeys("55555");

        getDriver().findElement(By.xpath("//button[@class='mat-raised-button mat-primary']")).click();
        System.out.println(getDriver().getTitle());
        Thread.sleep(3000);
    }


    @Then("^Create Quiz with Textual question. Title \"([^\"]*)\"$")
    public void createQuizT(String titles) throws Throwable {
        //----------------------------------------
        iWaitForElement("//h5[text()='Quizzes']//ancestor::a");
        getDriver().findElement(By.xpath("//h5[text()='Quizzes']//ancestor::a")).click();
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");

        getDriver().findElement(By.xpath("//div[@class='controls']//button")).click();
        iWaitForElement("//input[@placeholder='Title Of The Quiz *']");
        WebElement tit = getDriver().findElement(By.xpath("//input[@placeholder='Title Of The Quiz *']"));
        System.out.println(tit);
        WebElement title = getDriver().findElement(By.xpath("//input[@placeholder='Title Of The Quiz *']"));
        title.click();
        title.sendKeys(titles);
        Thread.sleep(1000);

    }

    @Then("^Create Quiz with Single-choice question. Title \"([^\"]*)\"$")
    public void createQuiz(String titles) throws Throwable {
        //----------------------------------------
        getDriver().findElement(By.xpath("//h5[text()='Quizzes']")).click();
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");

        getDriver().findElement(By.xpath("//div[@class='controls']//button")).click();
        iWaitForElement("//input[@placeholder='Title Of The Quiz *']");

        WebElement title = getDriver().findElement(By.xpath("//input[@placeholder='Title Of The Quiz *']"));
        title.click();
        title.sendKeys(titles);
        Thread.sleep(1000);
    }


    @Then("^Create Quiz with Multiple-choice question. Title \"([^\"]*)\"$")
    public void createQuizM(String titles) throws Throwable {
        //----------------------------------------
        getDriver().findElement(By.xpath("//h5[text()='Quizzes']")).click();
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");

        getDriver().findElement(By.xpath("//div[@class='controls']//button")).click();
        iWaitForElement("//input[@placeholder='Title Of The Quiz *']");

        WebElement title = getDriver().findElement(By.xpath("//input[@placeholder='Title Of The Quiz *']"));
        title.click();
        title.sendKeys(titles);
        Thread.sleep(1000);

    }

    @Then("^I verify that Quiz Title equal \"([^\"]*)\"$")
    public void isQuizEdited(String title) throws Throwable {
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");
        String being = getDriver().findElement(By.xpath("//span/mat-panel-title[contains(text(),'" + title + "')]")).getText();
        System.out.println("being  " + being);
        System.out.println(title);
        System.out.println("split  " + "//span/mat-panel-title[contains(text(),'" + title.split("(EDITED)")[0] + "']");

        System.out.println("current title = " + being);
        assertThat(being).contains(title);
    }


    @Then("^I verify that Question with xpath \"([^\"]*)\" equal \"([^\"]*)\"$")
    public void isQuestionEdited(String xpath, String question) throws Throwable {
        iWaitForElement(xpath);
        //mat-panel-title[contains(text(),'Q1:')]
        String being = getDriver().findElement(By.xpath(xpath)).getText();
        System.out.println("being  " + being);
        System.out.println(question);
        System.out.println("current question = " + being);
        assertThat(being).contains(question);
    }


    @Then("^I verify that Quiz \"([^\"]*)\" was created$")
    public void isQuizCreated(String title) throws Throwable {
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");
        String being = getDriver().findElement(By.xpath("//span/mat-panel-title[contains(text(),'" + title + "')]")).getText();
        assertThat(being).contains(title);
    }

    @Then("^I verify that \"([^\"]*)\" is unique$")
    public void iVerifyThatQuizSNameIsUnique(String arg0) throws Throwable {
        iWaitForElement("//*[@href='/#/quizzes']//h5");
        getDriver().findElement(By.xpath("//*[@href='/#/quizzes']//h5")).click();

        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");
        List<WebElement> dubname = getDriver().findElements(By.xpath("//span/mat-panel-title" +
                "[contains(text(),'" + arg0 + "')]"));

        for (WebElement name : dubname) {
            List<WebElement> mustHave = getDriver().findElements(By.xpath("//span/mat-panel-title[contains(text(),'" + arg0 + "')]"));
            if (name.getText().contains(arg0)) {
//                System.out.println(name.getText());
                System.out.println("");
            }
        }

//
        int dubles = getDriver().findElements(By.xpath("//span/mat-panel-title" +
                "[contains(text(),'" + arg0 + "')]")).size();
        if (dubles > 1) {
            System.out.println("\nWe have " + dubles + " same name Quizes");
        } else if (dubles == 0) {
            System.out.println("There are no any Quiz with name " + arg0);

        } else {
            System.out.println("Quiz`s name is unique");
        }
        ;
//        assertThat(1).isEqualTo(dubles);
        openListOfQuizzes();
    }

    @Then("^Add question$")
    public void addOneTextualQuestion() throws Throwable {
        getDriver().findElement(By.xpath("//form/div/button[@class='mat-button mat-primary']")).click();
    }


    @Then("^I choose type of question as Textual$")
    public void iChooseTypeOfQuestionAsTextual() throws Throwable {
        getDriver().findElement(By.xpath("//*[contains(text(), 'Textual')]/..")).click();
    }


    @Then("^I choose type of question as \"([^\"]*)\"$")
    public void iChooseTypeOfQuestionAsSingleChoise(String types) throws Throwable {
        String xpath = "(//div[contains(text(), '" + types + "')])[last()]/../..";
        iWaitForElement(xpath);
        getDriver().findElement(By.xpath(xpath)).click();
    }


    @Then("^Quiz \"([^\"]*)\" has (\\d+) questions$")
    public void iVerifyThatNumberOfQuestion(String arg0, int arg1) throws Throwable {
        getDriver().findElement(By.xpath("//h5[text()='Quizzes']")).click();
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");
        String quiz = "(//*[contains(text(),'" + arg0 + "')]//ancestor::mat-expansion-panel)[1]";
        WebElement element = getDriver().findElement(By.xpath(quiz));
        element.click();
        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        executor.executeScript("arguments[0].scrollIntoView(true);", element);
        String xpath2 = "(//*[contains(text(),'" + arg0 + "')]//ancestor::mat-expansion-panel)[1]//descendant::tr[1]/td[2]";
        int number = Integer.parseInt(getDriver().findElement(By.xpath(xpath2)).getText());
        System.out.println("\nTotal Questions = " + number);

        assertThat(arg1).isEqualTo(number);
    }


    @Then("^Quiz \"([^\"]*)\" has Maximum possible score = (\\d+)$")
    public void iVerifyThatQuizHasMaximumPossibleScore(String arg0, int arg1) throws Throwable {

        getDriver().findElement(By.xpath("//h5[text()='Quizzes']")).click();
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");
        String quiz = "(//*[contains(text(),'" + arg0 + "')]//ancestor::mat-expansion-panel)[1]";

        WebElement element = getDriver().findElement(By.xpath(quiz));
        element.click();
        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        executor.executeScript("arguments[0].scrollIntoView(true);", element);
        String xpath2 = "(//*[contains(text(),'" + arg0 + "')]//ancestor::mat-expansion-panel)[1]//descendant::tr[2]/td[2]";

        int number = Integer.parseInt(getDriver().findElement(By.xpath(xpath2)).getText());
        System.out.println("\nMaximum possible score " + number);

        assertThat(arg1).isEqualTo(number);
    }


    @Then("^I click Edit button for \"([^\"]*)\"$")
    public void iClickEditButton(String arg0) throws Throwable {
        String xpath = "//span/mat-panel-title[contains(text(),'" + arg0 + "')]/../../../div//a[@href]/button";
        step.iWaitForElementWithXpathToBePresent(xpath);
        getDriver().findElement(By.xpath(xpath)).click();// Write code here that turns the phrase above into concrete actions
    }

    @Then("^I Delete \"([^\"]*)\"$")
    public void iClickDeleteButton(String arg0) throws Throwable {

        openListOfQuizzes();
        getDriver().navigate().refresh();

        String buttonXpath = "(//span/mat-panel-title[contains(text(),'" + arg0 + "')])[last()]/../../../div//button[@color='warn']";
        String popUpButton = "//button[@class='mat-button mat-warn']//span[@class='mat-button-wrapper'][contains(text(),'Delete')]";
        String IsOrNon = "(//span[@class='mat-content']/mat-panel-title[contains(text(), normalize-space('" + arg0 + "'))])";
        iWaitForElement(IsOrNon);
        try {
            List<WebElement> doubles = getDriver().findElements(By.xpath(IsOrNon));
            List<WebElement> dubname = getDriver().findElements(By.xpath("//span/mat-panel-title" +
                    "[contains(text(),'" + arg0 + "')]"));
            if (doubles.size() > 0) {
                String quizXpath = "(//span[@class='mat-content']/mat-panel-title[contains(text(), normalize-space('" + arg0 + "'))])[" + (int) doubles.size() + "]";
                iWaitForElement(quizXpath);
                step.iWaitForSec(1);
                WebElement quiz = getDriver().findElement(By.xpath(quizXpath));
                quiz.click();
                JavascriptExecutor executor = (JavascriptExecutor) getDriver();
                executor.executeScript("arguments[0].scrollIntoView(true);", quiz);

                WebElement button = getDriver().findElement(By.xpath(buttonXpath));
                step.iWaitForSec(1);
                button.click();

                step.iClickOnElementUsingJavaScriptWithXpath(popUpButton);
            } else {
                System.out.println(" There aren`t any Quizzes ");
                assertThat(doubles.size()).isNotZero();
            }
        } finally {
            System.out.println("\nNo quiz");
        }
    }

    @Then("^Quiz \"([^\"]*)\" should not be presented$")
    public void quizWithNameShouldNotBePresent(String arg0) throws Exception {
        step.iWaitForSec(5);
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");

        String xpath = "//span[@class='mat-content']/mat-panel-title[contains(text(), normalize-space('" + arg0 + "'))]";
        List<WebElement> quizzes = getDriver().findElements(By.xpath(xpath));
        System.out.println("We have " + quizzes.size() + " quizzes");
        assertThat(getDriver().findElements(By.xpath(xpath))).hasSize(0);
    }

    @Then("^I return Quiz name \"([^\"]*)\"$")
    public String iReturnQuizName(String arg0) throws Throwable {
        //*[@class="mat-expansion-panel-header-title"][(contains(text(),'Quiz with textual question')) and not(contains(text(),'EDITED'))]
        String xpath = "//span[@class='mat-content']/mat-panel-title[contains(text(), normalize-space('" + arg0 + "'))]";
        iWaitForElement("//h4[contains(text(), 'List of Quizzes')]");
        WebElement quiz = getDriver().findElement(By.xpath(xpath));
        System.out.println("xpath " + xpath);
        System.out.println("Quiz name " + quiz.getText());
        quiz.click();

        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        executor.executeScript("arguments[0].scrollIntoView(true);", quiz);
        return quiz.getText();
    }


    @Then("^i send key \"([^\"]*)\"$")
    public void iSendKey(String arg0) throws Throwable {
        WebElement elem = getDriver().findElement(By.xpath("//input[@placeholder='First Name']"));
        elem.click();
        elem.sendKeys("TTTTTT");
        elem.sendKeys(Keys.chord(Keys.CONTROL, arg0));
    }

    @Then("^I navigate to \"([^\"]*)\" page$")
    public void iNavigateToPage(String arg0) throws Throwable {
        getDriver().findElement(By.xpath("//a[@href='/#/users-management']")).click();
    }

    @And("^I choose tab \"([^\"]*)\"$")
    public void iChooseTab(String arg0) throws Throwable {
        getDriver().findElement(By.xpath("//div[contains(text(),'" + arg0 + "')]/..")).click();
    }

    @Then("^I verify User \"([^\"]*)\" was deleted$")
    public void iVerifyUserWasDeleted(String arg0) throws Throwable {
        iChooseTab("Teachers");
        step.iWaitForSec(1);
        step.elementWithXpathShouldNotBePresent("//h4[contains(text(), normalize-space('" + arg0 + "'))]");
    }
    @Then("^I find User by name \"([^\"]*)\"$")
    public void iFindUserByName(String arg0) throws Throwable {
        String xpath = "//h4[contains(text(), normalize-space('" + arg0 + "'))]";
        System.out.println(xpath);
        WebElement user = getDriver().findElement(By.xpath(xpath));
        System.out.println("User name " + user.getText());

        step.iWaitForSec(5);
        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        executor.executeScript("arguments[0].scrollIntoView(true);", user);
        user.click();
    }

    @And("^I delete Teacher with name \"([^\"]*)\"$")
    public void iDelete(String arg0) throws Throwable {
        iFindUserByName(arg0);
        step.iClickOnElementUsingJavaScriptWithXpath("//div[@class='right']/button");
        step.iClickOnElementUsingJavaScriptWithXpath("(//button/mat-icon)[3]");
        step.iClickOnElementUsingJavaScriptWithXpath("//button[@class='mat-button mat-warn']//span[@class='mat-button-wrapper'][contains(text(),'Delete')]");
    }

    @Given("^I open registration page$")
    public void iOpenRegistrationPage() throws Throwable {
        getDriver().get("http://local.school.portnov.com:4520/#/registration");
        step.iWaitForElementWithXpathToBePresent("//input[@placeholder='Password']");
    }

    @Then("^I type \"([^\"]*)\" into \"([^\"]*)\"$")
    public void iTypeInto(String arg0, String arg1) throws Throwable {
        step.iTypeIntoElementWithXpath(arg0, "//input[@placeholder='" + arg1 + "']");
        step.iClickOnElementWithXpath("//h4");
        step.iWaitForSec(3);
    }

    @Then("^Page title is \"([^\"]*)\"$")
    public void iShouldSeePageTitleAs(String title) {
        assertThat(getDriver().getTitle()).isEqualTo(title);
    }

    @Then("^I shouldn`t see error message$")
    public void errorMessageShouldNotPresented() throws Throwable {
        step.elementWithXpathShouldNotBePresent("//*[contains(text(), 'Entered passwords should match')]");
    }

    @Then("^I should see error message$")
    public void errorMessageShouldPresented() throws Throwable {
        step.elementWithXpathShouldBeDisplayed("//*[contains(text(), 'Entered passwords should match')]");
    }

    @When("^I type \"([^\"]*)\"$")
    public void iType(String text) throws InterruptedException {
        String xpath = "//textarea";
        iWaitForElement("//textarea");
        getDriver().findElement(By.xpath(xpath)).clear();
        getDriver().findElement(By.xpath(xpath)).sendKeys(text);
    }

    @When("^I type second question \"([^\"]*)\"$")
    public void iTypeIntoSecondQuestion(String text) throws Exception {
        String xpath = "//mat-expansion-panel[2]//textarea[@placeholder='Question *']";
        iWaitForElement(xpath);
        getDriver().findElement(By.xpath(xpath)).clear();
        getDriver().findElement(By.xpath(xpath)).sendKeys(text);
    }


    @And("^I click Show-stoper$")
    public void iClickShowStoper() throws Throwable {
        String xpath = "(//*[contains(text(), 'Show-Stopper')])[1]//ancestor::label//div";
        iWaitForElement(xpath);
        getDriver().findElement(By.xpath(xpath)).click();
    }

    @And("^I click Other$")
    public void iClickOther() throws Throwable {
        String xpath = "//*[contains(text(), 'Include ')]//ancestor::mat-checkbox";
        iWaitForElement(xpath);
        getDriver().findElement(By.xpath(xpath)).click();
    }


    @Then("^I verify that Show-Stoper selected$")
    public void iVerifyThatShowStoperSelected() throws Throwable {
        String xpath = "(//*[contains(text(), 'Show-Stopper')])[1]//ancestor::label//div/input";
        System.out.println("\n GUI Show-Stopper is selected " + getDriver().findElement(By.xpath(xpath)).isSelected());
        System.out.println("\n HTML Show-Stopper is selected " + getDriver().findElement(By.xpath(xpath)).getAttribute("aria-checked"));
    }

    @Then("^I verify that Other selected$")
    public void iVerifyThatOtherSelected() throws Throwable {
        String xpath = "(//*[contains(text(), 'Other')])//ancestor::label//div/input";
        System.out.println("\n GUI Show-Stopper is selected " + getDriver().findElement(By.xpath(xpath)).isSelected());
        System.out.println("\n HTML Show-Stopper is selected " + getDriver().findElement(By.xpath(xpath)).getAttribute("aria-checked"));
    }

    @And("^i choose correct answer. Option (\\d+)$")
    public void iCorrectAnswerOption(int arg0) throws Throwable {
        String xpath = "(//textarea[@placeholder='Option " + arg0 + "*'])[1]/ancestor::mat-radio-group/mat-radio-button";
        System.out.println(xpath);
        getDriver().findElement(By.xpath(xpath)).click();
    }


    @And("^i choose correct answer in Multiple-Choice. Option (\\d+)$")
    public void iCorrectAnswerinMCOption(int arg0) throws Throwable {
        String xpath = "(//textarea[@placeholder='Option " + arg0 + "*'])//ancestor::div/mat-checkbox";
        getDriver().findElement(By.xpath(xpath)).click();
    }



}






