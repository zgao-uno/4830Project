package Library;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;
import java.io.File;

public class testTeamRed {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();
  JavascriptExecutor js;
  @Before
  public void setUp() throws Exception {
    System.setProperty("webdriver.chrome.driver", "lib/win/chromedriver.exe");
    driver = new ChromeDriver();
    baseUrl = "https://www.google.com/";
    driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
    js = (JavascriptExecutor) driver;
  }

  @Test
  public void testSubmitReview() throws Exception {
	  driver.get("http://ec2-3-22-249-161.us-east-2.compute.amazonaws.com:8080/LibProject/login.jsp");
    driver.findElement(By.name("email")).click();
    Thread.sleep(1500);
    driver.findElement(By.name("email")).clear();
    driver.findElement(By.name("email")).sendKeys("3");
    driver.findElement(By.name("password")).click();
    Thread.sleep(1500);
    driver.findElement(By.name("password")).clear();
    driver.findElement(By.name("password")).sendKeys("3");
    driver.findElement(By.xpath("//button[@type='submit']")).click();
    Thread.sleep(1500);
    driver.findElement(By.linkText("Review Board")).click();
    Thread.sleep(1500);
    driver.findElement(By.xpath("//button[@type='submit']")).click();
    Thread.sleep(1500);
    driver.findElement(By.name("title")).click();
    driver.findElement(By.name("title")).click();
    Thread.sleep(1500);
    driver.findElement(By.name("title")).clear();
    driver.findElement(By.name("title")).sendKeys("Of Mice and Men");
    Thread.sleep(1500);
    driver.findElement(By.name("author")).clear();
    driver.findElement(By.name("author")).sendKeys("John Steinbeck");
    Thread.sleep(1500);
    driver.findElement(By.name("rate")).clear();
    driver.findElement(By.name("rate")).sendKeys("5");
    Thread.sleep(1500);
    driver.findElement(By.name("summary")).clear();
    driver.findElement(By.name("summary")).sendKeys("This is an excellent book!");
    Thread.sleep(1500);
    driver.findElement(By.xpath("//button[@type='submit']")).click();
  }
  
  @Test
  public void testCheckIn() throws Exception {
    driver.get("http://ec2-3-22-249-161.us-east-2.compute.amazonaws.com:8080/LibProject/login.jsp");
    driver.findElement(By.name("email")).click();
    driver.findElement(By.name("email")).clear();
    Thread.sleep(1500);
    driver.findElement(By.name("email")).sendKeys("3");
    driver.findElement(By.name("password")).click();
    driver.findElement(By.name("password")).clear();
    Thread.sleep(1500);
    driver.findElement(By.name("password")).sendKeys("3");
    Thread.sleep(1500);
    driver.findElement(By.xpath("//button[@type='submit']")).click();
    Thread.sleep(1500);
    driver.findElement(By.linkText("Book Search")).click();
    Thread.sleep(1500);
    driver.findElement(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='fiction'])[2]/following::button[1]")).click();
    Thread.sleep(1500);
    driver.findElement(By.linkText("Check-in")).click();
    Thread.sleep(1500);
    driver.findElement(By.xpath("//button[@type='submit']")).click();
    Thread.sleep(1500);
    driver.findElement(By.linkText("Book Search")).click();
    Thread.sleep(1500);
    driver.findElement(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='fiction'])[4]/following::button[1]")).click();
    Thread.sleep(1500);
    driver.findElement(By.linkText("Checkout History")).click();
    Thread.sleep(1500);
    driver.findElement(By.linkText("Check-in")).click();
    Thread.sleep(1500);
    driver.findElement(By.xpath("//button[@type='submit']")).click();
  }
  
  @Test
  public void testLogin() throws Exception {
    driver.get("http://ec2-3-22-249-161.us-east-2.compute.amazonaws.com:8080/LibProject/login.jsp");
    driver.findElement(By.name("email")).click();
    driver.findElement(By.name("email")).clear();
    driver.findElement(By.name("email")).sendKeys("test@unomaha.edu");
    driver.findElement(By.name("password")).click();
    driver.findElement(By.name("password")).clear();
    driver.findElement(By.name("password")).sendKeys("test11");
    driver.findElement(By.xpath("//button[@type='submit']")).click();
  }
  
  public void doLogin() throws Exception {
	  	driver.get("http://ec2-3-22-249-161.us-east-2.compute.amazonaws.com:8080/LibProject/login.jsp");
	    driver.findElement(By.name("email")).click();
	    driver.findElement(By.name("email")).clear();
	    driver.findElement(By.name("email")).sendKeys("test@unomaha.edu");
	    driver.findElement(By.name("password")).click();
	    driver.findElement(By.name("password")).clear();
	    driver.findElement(By.name("password")).sendKeys("test11");
	    driver.findElement(By.xpath("//button[@type='submit']")).click();
  }
  
  @Test
  public void testProfile() throws Exception {
	doLogin();
    driver.findElement(By.xpath("//ul[2]/li/a")).click();
    driver.findElement(By.linkText("Your Profile")).click();
    driver.findElement(By.name("firstName")).click();
    driver.findElement(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::div[2]")).click();
    driver.findElement(By.name("firstName")).clear();
    driver.findElement(By.name("firstName")).sendKeys("Zekun");
    driver.findElement(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='First Name'])[1]/following::div[2]")).click();
    driver.findElement(By.name("lastName")).clear();
    driver.findElement(By.name("lastName")).sendKeys("Gao");
    driver.findElement(By.name("phone")).click();
    driver.findElement(By.name("phone")).clear();
    driver.findElement(By.name("phone")).sendKeys("1236812323");
    driver.findElement(By.xpath("//button[@type='submit']")).click();
  }
  
  @Test
  public void testFeedback() throws Exception {
	doLogin();
    driver.findElement(By.xpath("//ul[2]/li/a")).click();
    driver.findElement(By.linkText("Feedback")).click();
    driver.findElement(By.name("feedback")).click();
    driver.findElement(By.name("feedback")).clear();
    driver.findElement(By.name("feedback")).sendKeys("test");
    driver.findElement(By.xpath("//button[@type='submit']")).click();
  }
  
  @Test
  public void testLogout() throws Exception {
	doLogin();
	driver.findElement(By.xpath("//ul[2]/li/a")).click();
    driver.findElement(By.linkText("Sign out")).click();
    driver.get("http://ec2-3-22-249-161.us-east-2.compute.amazonaws.com:8080/LibProject/main.jsp");
    driver.get("http://ec2-3-22-249-161.us-east-2.compute.amazonaws.com:8080/LibProject/updateInfo.jsp");
  }
  
  @Test
  public void testBookSearch() throws Exception
  {
	  doLogin();
	  driver.findElement(By.xpath("//ul[1]/li/a")).click();
	  driver.findElement(By.linkText("Book Search")).click();
	  driver.findElement(By.name("booksearch")).click();
	  driver.findElement(By.name("booksearch")).clear();
	 
	  driver.findElement(By.name("booksearch")).sendKeys("Harry Potter");
	  
	  driver.findElement(By.xpath("//button[@type='submit']")).click();
	  driver.findElement(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Genre'])[1]/following::td[1]"));

  }
  
  @Test
  public void testEmptyBookSearch() throws Exception 
  {
	  doLogin();
	  driver.findElement(By.xpath("//ul[1]/li/a")).click();
	  driver.findElement(By.linkText("Book Search")).click();
	  driver.findElement(By.name("booksearch")).click();
	  driver.findElement(By.name("booksearch")).clear();
	 
	  driver.findElement(By.name("booksearch")).sendKeys("");
	  
	  driver.findElement(By.xpath("//button[@type='submit']")).click();
  }
  
  @Test
  public void testCheckout() throws Exception
  {
	  doLogin();
	  driver.findElement(By.xpath("//ul[1]/li/a")).click();
	  driver.findElement(By.linkText("Book Search")).click();
	  
	
	  driver.findElement(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='fiction'])[2]/following::button[1]")).click();
	  driver.findElement(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='fiction'])[3]/following::button[1]")).click();
  }
  
  @Test
  public void testCheckoutHistory() throws Exception
  {
	  doLogin();
	  
	  driver.findElement(By.xpath("//ul[1]/li/a")).click();
	  driver.findElement(By.linkText("Checkout History")).click();
	  
	  isElementPresent(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='fiction'])[10]/following::td[1]"));
  }

  @After
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
