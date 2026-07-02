from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class DashboardPage:

    SUCCESS_HEADING = (By.CLASS_NAME, "post-title")
    LOGOUT_BUTTON = (By.LINK_TEXT, "Log out")

    def __init__(self, driver):
        self.driver = driver
        self.wait = WebDriverWait(driver, 10)

    def is_dashboard_loaded(self):
        heading = self.wait.until(
            EC.visibility_of_element_located(self.SUCCESS_HEADING)
        )
        return heading.text == "Logged In Successfully"

    def is_logout_button_displayed(self):
        return self.wait.until(
            EC.visibility_of_element_located(self.LOGOUT_BUTTON)
        ).is_displayed()

    def get_page_title(self):
        return self.driver.title