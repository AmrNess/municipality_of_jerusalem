from selenium.webdriver.common.by import By

from selenium.webdriver.common.by import By

from ui_widgets.base_widget import BaseWidget
from infra import logger, custom_exceptions as ce

log = logger.get_logger(__name__)


# //div[contains(@class, 'topbar')]//li[contains(@class,'inserted')]
class Header(BaseWidget):
    def __init__(self, label):
        super().__init__(label)

    # @property
    # def get_text(self):
    #     return self.web_element.get_attribute('value')

    @property
    def locator(self):
        return {
            'By': By.XPATH,
            'Value': "//div[contains(@class, 'topbar')]",
            'Value2': "//*[@class='lib-footer']",
            'logo' : "//a[@href='https://www.jerusalem.muni.i/']",
            'text' : "//div[contains(text(),'שרותים דיגיטליים')]",
            'arabic' : "//a[contains(text(),'العربية')]",
            'hebrew' : "//a[contains(text(),'עברית')]"
        }

    def check_header_element(self, path):
        elementHeader = self.web_element.find_element(self.locator['By'], self.locator['Value'])
        try:
            elementHeader.find_element(By.XPATH,  self.locator[path])
            if elementHeader is not None:
                return True
            return False
        except:
            return False

    @property
    def is_invalid(self):
        return 'ng-invalid' in self.web_element.get_attribute('class')

    @property
    def is_valid(self):
        return 'ng-valid' in self.web_element.get_attribute('class')
