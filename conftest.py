import os
import pytest

from utils.driver_factory import DriverFactory
from utils.llm_helper import explain_failure


@pytest.fixture()
def driver():

    driver = DriverFactory.get_driver()

    yield driver

    driver.quit()


@pytest.hookimpl(hookwrapper=True)
def pytest_runtest_makereport(item, call):

    outcome = yield
    report = outcome.get_result()

    if report.when == "call" and report.failed:

        driver = item.funcargs.get("driver")

        if driver:

            os.makedirs("reports", exist_ok=True)
            os.makedirs("screenshots", exist_ok=True)

            screenshot_path = f"screenshots/{item.name}.png"
            driver.save_screenshot(screenshot_path)

            explanation = explain_failure(
                test_name=item.name,
                error_message=str(call.excinfo.value),
                current_url=driver.current_url,
                page_title=driver.title
            )

            with open("reports/llm_failure_report.txt", "a", encoding="utf-8") as file:

                file.write("=" * 80 + "\n")
                file.write(f"Test Name : {item.name}\n")
                file.write(f"URL       : {driver.current_url}\n")
                file.write(f"Title     : {driver.title}\n")
                file.write(f"Screenshot: {screenshot_path}\n\n")

                file.write(explanation)
                file.write("\n\n")