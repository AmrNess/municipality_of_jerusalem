from selenium.webdriver.common.by import By

from selenium.webdriver.common.by import By

from ui_widgets.base_widget import BaseWidget
from infra import logger, custom_exceptions as ce

log = logger.get_logger(__name__)


# //div[contains(@class, 'topbar')]//li[contains(@class,'inserted')]
class Langauge(BaseWidget):
    def __init__(self, label):
        super().__init__(label)

    # @property
    # def get_text(self):
    #     return self.web_element.get_attribute('value')

    @property
    def locator(self):
        return {
            'By': By.XPATH,
            'Value': "//li[contains(@class,' lang-menu__item')]",
        }

    def check_lang(self):
        currnt_lang = self.web_element.find_element(by=By.XPATH , value= "//li[contains(@class,' lang-menu__item') and contains(@class,'active')]//a")
        return currnt_lang.text

    def change_lang(self , value_selected):
        selected_lang = self.check_lang()
        if selected_lang != value_selected :
            self.web_element.find_element(by=By.XPATH , value=f"//a[contains(text(),'{value_selected}')]").click()
        return value_selected

    # @property
    # def active(self):
    #     return 'active' in self.web_element.get_attribute('class')

