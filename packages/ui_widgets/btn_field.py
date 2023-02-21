from selenium.webdriver.common.by import By

from ui_widgets.base_widget import BaseWidget
from infra import logger, custom_exceptions as ce

log = logger.get_logger(__name__)


class BtnField(BaseWidget):
    def __init__(self, label):
        super().__init__(label)

    @property
    def get_text(self):
        return self.web_element.get_attribute('value')

    @property
    def locator(self):
        return {
            'By': By.XPATH,
            'Value': f"//span[contains(text(),'{self.label}')]",
        }

    def clickBtn(self):
        self.web_element.click()


