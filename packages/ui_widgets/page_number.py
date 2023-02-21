from selenium.webdriver.common.by import By

from selenium.webdriver.common.by import By

from ui_widgets.base_widget import BaseWidget
from infra import logger, custom_exceptions as ce

log = logger.get_logger(__name__)


class PageNumber(BaseWidget):
    def __init__(self, label):
        super().__init__(label)


    @property
    def locator(self):
        return {
            'By': By.XPATH,
            'Value': f"//ul[@class='lib-stepper-list']/li"
        }


    def get_pages_count(self):
        return self.web_element.find_elements(self.locator['By'], self.locator['Value'])


    def get_page_number(self):
        page = self.get_pages_count()
        for num in page:
            if self.expanded_selected_check:
                return num.text.split('\n')[0]
            return 0

    def check_current_page(self,number):
        assert self.get_page_number() == number,f"you are not in page {number} you in page {self.get_page_number()}"

    def check_pages_numbers(self,number):
        log.info(f"number of pages '{len(self.get_pages_count())}'")
        assert len(self.get_pages_count()) == number,"pages numbers not equal"

    @property
    def expanded_selected_check(self):
        return self.web_element.get_attribute('aria-expanded') == "true" and self.web_element.get_attribute('aria-selected') == "true"

