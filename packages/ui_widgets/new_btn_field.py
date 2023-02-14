from selenium.webdriver.common.by import By
from ui_widgets.base_widget import BaseWidget
from infra import logger

log = logger.get_logger(__name__)


class NewBtnField(BaseWidget):
    def __init__(self, label):
        super().__init__(label)

    @property
    def get_text(self):
        return self.web_element.text

    @property
    def locator(self):
        return {
             'By': By.XPATH,
             'Value': f"//button[contains(@title, '{self.label}')]"
        }

    def clickBtn(self):
        self.web_element.click()



