from pages.login_page import LoginPage
from pages.dashboard_page import DashboardPage
from utils.config import VALID_USERNAME, VALID_PASSWORD


class TestDashboard:

    def test_dashboard_loaded(self, driver):

        login = LoginPage(driver)
        login.open()
        login.login(VALID_USERNAME, VALID_PASSWORD)

        dashboard = DashboardPage(driver)

        assert dashboard.is_dashboard_loaded()

    def test_logout_button_visible(self, driver):

        login = LoginPage(driver)
        login.open()
        login.login(VALID_USERNAME, VALID_PASSWORD)

        dashboard = DashboardPage(driver)

        assert dashboard.is_logout_button_displayed()