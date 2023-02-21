from selenium.webdriver.common.by import By

from ui_widgets.base_widget import BaseWidget
from infra import logger, custom_exceptions as ce

log = logger.get_logger(__name__)


class TextField(BaseWidget):
    def __init__(self, label, path_locator="following-sibling::input"):
        super().__init__(label)
        self.path_locator = path_locator

    @property
    def get_text(self):
        return self.web_element.get_attribute('value')

    @property
    def locator(self):
        return {
            'By': By.XPATH,
            'Value': f"//label[contains(text(),'{self.label}')]/{self.path_locator}"
        }

    def check_text(self, entered_text):
        checker = self.web_element.get_attribute('value') == entered_text
        return checker

    def set_text(self, text):
        self.clear()
        self.web_element.send_keys(text)

    def clear(self):
        self.web_element.clear()

    def has_text(self, text):
        return text in self.get_text

    @property
    def is_invalid(self):
        return 'ng-invalid' in self.web_element.get_attribute('class')

    @property
    def is_valid(self):
        return 'ng-valid' in self.web_element.get_attribute('class')

    def check_error_text(self, error_expectation):
        error_msg = self.web_element.find_element(by=By.XPATH, value=f"./following-sibling::div/div")
        if error_expectation == error_msg.text:
            return True

