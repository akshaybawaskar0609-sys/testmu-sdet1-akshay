import pytest

from pages.login_page import LoginPage
from utils.config import (
    VALID_USERNAME,
    VALID_PASSWORD,
    INVALID_USERNAME,
    INVALID_PASSWORD
)


class TestLogin:

    def test_valid_login(self, driver):

        login = LoginPage(driver)

        login.open()

        login.login(
            VALID_USERNAME,
            VALID_PASSWORD
        )

        assert "Logged In Successfully" in login.get_success_message()

    def test_invalid_login(self, driver):

        login = LoginPage(driver)

        login.open()

        login.login(
            INVALID_USERNAME,
            INVALID_PASSWORD
        )

        assert "Your username is invalid!" in login.get_error_message()


# This test intentionally fails to demonstrate
# the LLM-powered failure explanation (Task 3 - Option A).

    def test_llm_failure_explainer_demo(self, driver):

        login = LoginPage(driver)

        login.open()

        login.login(VALID_USERNAME, VALID_PASSWORD)

        # Intentional failure to demonstrate LLM integration
        assert "Dashboard" in login.get_success_message()