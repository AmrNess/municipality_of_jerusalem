import time
from time import sleep

from requests import options
from selenium.webdriver import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.wait import WebDriverWait

from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.wait import WebDriverWait
from webdriver_manager.core import driver
import keyboard
from ui_widgets.base_widget import BaseWidget
from infra import logger, custom_exceptions as ce

log = logger.get_logger(__name__)


class dropDown(BaseWidget):
    def __init__(self, label, prefix_value="/following-sibling::div/p-dropdown",
                 path="following-sibling::p-dropdown"):
        super().__init__(label)
        self.prefix_value = prefix_value
        self.path = path

    @property
    def get_text(self):
        return self.web_element.get_attribute('value')

    @property
    def locator(self):
        return {
            'By': By.XPATH,
            'Value': f"//label[contains(text(),'{self.label}')]{self.prefix_value}",
            'Value2': f"//label[contains(text(),'{self.label}')]/{self.path}"

        }

    def pick_element(self, value_selected):
        dropDown_open = self.web_element.get_attribute('aria-expanded')
        if dropDown_open in ('false', None):
            self.web_element.click()
        self.web_element.find_element(by=By.XPATH, value=f".//li[@aria-label='{value_selected}']").click()
        result = self.web_element.text
        returnResult = result.splitlines()[0]
        return returnResult

