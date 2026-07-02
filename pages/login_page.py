from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

from utils.config import BASE_URL


class LoginPage:

    USERNAME = (By.ID, "username")
    PASSWORD = (By.ID, "password")
    LOGIN_BUTTON = (By.ID, "submit")
    SUCCESS_MESSAGE = (By.CLASS_NAME, "post-title")
    ERROR_MESSAGE = (By.ID, "error")

    def __init__(self, driver):
        self.driver = driver
        self.wait = WebDriverWait(driver, 10)

    def open(self):
        self.driver.get(BASE_URL)

    def login(self, username, password):
        self.driver.find_element(*self.USERNAME).clear()
        self.driver.find_element(*self.USERNAME).send_keys(username)

        self.driver.find_element(*self.PASSWORD).clear()
        self.driver.find_element(*self.PASSWORD).send_keys(password)

        self.driver.find_element(*self.LOGIN_BUTTON).click()

    def get_success_message(self):
        return self.wait.until(
            EC.visibility_of_element_located(self.SUCCESS_MESSAGE)
        ).text

    def get_error_message(self):
        return self.wait.until(
            EC.visibility_of_element_located(self.ERROR_MESSAGE)
        ).text