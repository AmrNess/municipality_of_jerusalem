from selenium.webdriver.common.by import By

from ui_widgets.base_widget import BaseWidget
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.core import driver


class SpecialNeeds(BaseWidget):
    def __init__(self, label):
        super().__init__(label)

    @property
    def locator(self):
        return {
            'By': By.XPATH,
            'Value': "//button[@id='INDmenu-btn']",
            'Value2': "//div[@id='INDmenu']"

        }

    def clickBtn(self):
        WebDriverWait(driver, 30).until(EC.visibility_of((self.web_element))).click()

    def clickBtnMenu(self):
        element = self.web_element.find_element(By.XPATH, "//button[@id='INDcloseAccMenu']")
        WebDriverWait(driver, 30).until(EC.visibility_of((element))).click()
