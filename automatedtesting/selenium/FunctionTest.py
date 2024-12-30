#!/usr/bin/env python
import logging
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.common.by import By

def setup_browser():
    """Set up the browser with options."""
    logging.info('Starting the browser...')
    options = ChromeOptions()
    options.add_argument("--headless")  # Uncomment for headless execution in Azure DevOps
    return webdriver.Chrome(options=options)

def login(driver, user, password):
    """Log in to the application."""
    logging.info('Navigating to the demo page to login.')
    driver.get('https://www.saucedemo.com/')
    driver.find_element(By.CSS_SELECTOR, "input[id='user-name']").send_keys(user)
    driver.find_element(By.CSS_SELECTOR, "input[id='password']").send_keys(password)
    driver.find_element(By.CSS_SELECTOR, "input[id='login-button']").click()
    
    # Verify login success
    results = driver.find_element(
        By.CSS_SELECTOR, 
        "div.header_secondary_container > div[id='inventory_filter_container'] > div[class='product_label']"
    ).text
    assert "Products" in results
    logging.info(f"Successfully logged in as {user}.")

def add_items_to_cart(driver):
    """Add items to the shopping cart."""
    logging.info("Starting the shopping...")
    path_inventory_item = "div[class='inventory_list'] > div[class='inventory_item']"
    product_items = driver.find_elements(By.CSS_SELECTOR, path_inventory_item)
    
    assert len(product_items) == 6
    logging.info("Successfully found 6 product items.")
    
    for i in range(6):
        product_item_name_selector = f"{path_inventory_item} > div[class='inventory_item_label'] > a[id='item_{i}_title_link'] > div[class='inventory_item_name']"
        product_item_name = driver.find_element(By.CSS_SELECTOR, product_item_name_selector)
        add_to_cart_button = product_item_name.find_element(
            By.XPATH, 
            '../../div[@class="pricebar"]//button[@class="btn_primary btn_inventory"]'
        )
        add_to_cart_button.click()
        logging.info(f"Successfully added to shopping cart: {product_item_name.text}")
    
    # Verify items added to cart
    shopping_cart_badge = driver.find_element(By.CSS_SELECTOR, "a.shopping_cart_link > span.shopping_cart_badge").text
    assert shopping_cart_badge == '6'
    logging.info("Successfully added 6 items to shopping cart.")

def remove_items_from_cart(driver):
    """Remove all items from the shopping cart."""
    logging.info("Removing items from the shopping cart...")
    driver.find_element(By.CSS_SELECTOR, "a.shopping_cart_link").click()
    
    # Verify navigation to cart page
    cart_title = driver.find_element(By.CSS_SELECTOR, "div[class='subheader']").text
    assert "Your Cart" in cart_title
    logging.info("Successfully entered the shopping cart page.")

    # Remove items from cart
    remove_buttons_selector = (
        "div.cart_item > div.cart_item_label > div.item_pricebar > button.btn_secondary.cart_button"
    )
    remove_buttons = driver.find_elements(By.CSS_SELECTOR, remove_buttons_selector)
    
    for button in remove_buttons:
        item_name = button.find_element(
            By.XPATH, 
            '../../a[contains(@id, "_title_link")]//div[@class="inventory_item_name"]'
        ).text
        button.click()
        logging.info(f"Successfully removed item from cart: {item_name}")
    
    # Verify cart is empty
    cart_badges = driver.find_elements(By.CSS_SELECTOR, "a.shopping_cart_link > span.shopping_cart_badge")
    assert len(cart_badges) == 0
    logging.info("Successfully removed all items from shopping cart.")

def functional_ui_test(user, password):
    """Execute the functional UI test."""
    logging.basicConfig(filename='selenium.log', level=logging.INFO, format='%(asctime)s %(levelname)s %(message)s')
    driver = setup_browser()
    
    try:
        login(driver, user, password)
        add_items_to_cart(driver)
        remove_items_from_cart(driver)
    except Exception as e:
        logging.error(f"An error occurred during the test: {e}")
        raise
    finally:
        driver.quit()
        logging.info("Browser closed.")

if __name__ == "__main__":
    functional_ui_test('standard_user', 'secret_sauce')