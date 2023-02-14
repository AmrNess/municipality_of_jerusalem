from selenium.webdriver.common.by import By
from ui_widgets.base_widget import BaseWidget
from infra import logger

log = logger.get_logger(__name__)


class Radio_button_field(BaseWidget):
    def __init__(self, label):
        super().__init__(label)

    @property
    def locator(self):
        return {
            'By': By.XPATH,
            'Value': f"//label[contains(text(),'{self.label}')]/following-sibling::div",
        }

    def select_radio_btn(self, selected_item):
        wanted_btn = self.web_element.find_element(by=By.XPATH, value=f"./p-radiobutton/label[contains(text(),'{selected_item}')]")
        wanted_btn.click()

    def who_is_selected(self):
        options = self.web_element.find_elements(by=By.XPATH, value=f"./p-radiobutton/label")
        for option in options:
            if "active" in option.get_attribute('class'):
                return option.text
        return -1

    def check_if_selected(self, selected_item):
        option = self.web_element.find_element(by=By.XPATH, value=f"./p-radiobutton/label[contains(text(),'{selected_item}')]")
        return "active" in option.get_attribute('class')

    def get_error_mgs(self, error_expected):
        error_msg = self.web_element.find_element(by=By.XPATH, value=f"./following-sibling::span")
        return error_msg.text == error_expected

    def is_invalid(self):
        return self.web_element.get_attribute('aria-invalid') == "true"

    def is_valid(self):
        return self.web_element.get_attribute('aria-invalid') == "false" or 'aria-invalid' not in self.web_element.get_attribute('class')



