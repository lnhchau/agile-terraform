from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.common.by import By
import datetime

def timestamp():
    return datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") + '\t'

def login(user, password):
    print(timestamp() + 'Starting the browser...')
    
    # Configure Chrome options
    options = ChromeOptions()
    options.add_argument("--headless")  # Run browser in headless mode
    options.add_argument('--no-sandbox')
    options.add_argument("--disable-extensions")
    options.add_argument('--remote-debugging-pipe')

    # Specify the Chrome binary location
    options.binary_location = "/usr/bin/google-chrome"  # Update this if Chrome binary is located elsewhere
    
    # Use the existing ChromeDriver
    service = ChromeService(executable_path="/usr/local/bin/chromedriver")  # Path to your existing ChromeDriver

    driver = webdriver.Chrome(service=service, options=options)
    print(timestamp() + 'Browser started successfully. Navigating to the login page.')
    driver.get('https://www.saucedemo.com/')
    
    # Perform login
    driver.find_element(By.CSS_SELECTOR, "input[id='user-name']").send_keys(user)
    driver.find_element(By.CSS_SELECTOR, "input[id='password']").send_keys(password)
    driver.find_element(By.ID, "login-button").click()
    print(timestamp() + f'Login successful with username "{user}" and password "{password}".')
    return driver

def add_cart(driver, n_items):
    """
    Adds a specified number of items to the shopping cart.
    Args:
        driver (webdriver.Chrome): Selenium WebDriver instance.
        n_items (int): Number of items to add to the cart.
    """
    print(timestamp() + 'Test: Adding items to the cart...')
    for i in range(n_items):
        element = f"a[id='item_{i}_title_link']"
        driver.find_element(By.CSS_SELECTOR, element).click()
        driver.find_element(By.CSS_SELECTOR, "button.btn_primary.btn_inventory").click()
        product = driver.find_element(By.CSS_SELECTOR, '.inventory_details_name.large_size').text
        print(timestamp() + f'{product} added to the shopping cart.')
        driver.find_element(By.CSS_SELECTOR, "button.inventory_details_back_button").click()
    print(timestamp() + f'{n_items} items successfully added to the shopping cart.')

def remove_cart(driver, n_items):
    """
    Removes a specified number of items from the shopping cart.
    Args:
        driver (webdriver.Chrome): Selenium WebDriver instance.
        n_items (int): Number of items to remove from the cart.
    """
    print(timestamp() + 'Test: Removing items from the cart...')
    for i in range(n_items):
        element = f"a[id='item_{i}_title_link']"
        driver.find_element(By.CSS_SELECTOR, element).click()
        driver.find_element(By.CSS_SELECTOR, "button.btn_secondary.btn_inventory").click()
        product = driver.find_element(By.CSS_SELECTOR, '.inventory_details_name.large_size').text
        print(timestamp() + f'{product} removed from the shopping cart.')
        driver.find_element(By.CSS_SELECTOR, "button.inventory_details_back_button").click()
    print(timestamp() + f'{n_items} items successfully removed from the shopping cart.')

def add_cart_check(driver, n_items):
    """
    Adds items to the shopping cart to prepare for checkout.
    Args:
        driver (webdriver.Chrome): Selenium WebDriver instance.
        n_items (int): Number of items to add to the cart.
    """
    print(timestamp() + 'Test: Adding items to the cart for checkout...')
    for i in range(n_items):
        element = f"a[id='item_{i}_title_link']"
        driver.find_element(By.CSS_SELECTOR, element).click()
        driver.find_element(By.CSS_SELECTOR, "button.btn_primary.btn_inventory").click()
        product = driver.find_element(By.CSS_SELECTOR, '.inventory_details_name.large_size').text
        print(timestamp() + f'{product} added to the shopping cart.')
        driver.find_element(By.CSS_SELECTOR, "button.inventory_details_back_button").click()
    print(timestamp() + f'{n_items} items successfully added to the shopping cart for checkout.')

def check_out(driver):
    """
    Completes the checkout process by filling out the necessary information and placing an order.
    Args:
        driver (webdriver.Chrome): Selenium WebDriver instance.
    """
    print(timestamp() + 'Test: Proceeding to checkout...')
    driver.get('https://www.saucedemo.com/inventory.html')
    driver.find_element(By.CSS_SELECTOR, '.shopping_cart_badge').click()
    driver.find_element(By.CSS_SELECTOR, '#checkout').click()
    driver.find_element(By.CSS_SELECTOR, "input[id='first-name']").send_keys('Mitch')
    driver.find_element(By.CSS_SELECTOR, "input[id='last-name']").send_keys('Philippe')
    driver.find_element(By.CSS_SELECTOR, "input[id='postal-code']").send_keys('99999')
    driver.find_element(By.CSS_SELECTOR, '#continue').click()
    driver.find_element(By.CSS_SELECTOR, '#finish').click()
    status_check = driver.find_element(By.CSS_SELECTOR, '.complete-header').text
    print(timestamp() + f'{status_check}. Your order has been dispatched and will arrive as fast as possible!')
    driver.find_element(By.CSS_SELECTOR, '#back-to-products').click()

if __name__ == "__main__":
    N_ITEMS = 6
    TEST_USERNAME = 'standard_user'
    TEST_PASSWORD = 'secret_sauce'

    driver = login(TEST_USERNAME, TEST_PASSWORD)
    add_cart(driver, N_ITEMS)
    remove_cart(driver, N_ITEMS)
    add_cart_check(driver, N_ITEMS)
    check_out(driver)
    print(timestamp() + 'Selenium tests completed successfully!')
