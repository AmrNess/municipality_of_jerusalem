from time import sleep

from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.wait import WebDriverWait

from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.wait import WebDriverWait
from webdriver_manager.core import driver

from ui_widgets.base_widget import BaseWidget
from infra import logger, custom_exceptions as ce
from ui_widgets.dropdown_field import dropDown

log = logger.get_logger(__name__)


class dropDownSearch(dropDown):
    def __init__(self, label,driver,path="following-sibling::p-dropdown"):
        super().__init__(label)
        self.path = path
        self.driver = driver

    @property
    def get_text(self):
        return self.web_element.get_attribute('value')

    def search_element(self, value_selected):
        # افحص ازا المنيو مفتوحة ولا لا قبل بعدين افتحها
        dropDown_open = self.web_element.get_attribute('aria-expanded')
        if dropDown_open in('false' , None):
            self.web_element.click()
        self.web_element.find_element(by=By.XPATH,
                                      value=f"//label[contains(text(),'{self.label}')]/following-sibling::p-dropdown//*/*/div/input[@type='text']").send_keys(
            value_selected)
        drop = self.web_element.find_element(by=By.XPATH, value="//p-dropdownitem")
        drop.click()
        result = self.web_element.text
        returnResult = result.splitlines()[0]
        return returnResult

    def scroll_for_ellemnt(self, value_selected):
        dropDown_open = self.web_element.get_attribute('aria-expanded')
        if dropDown_open in ('false', None):
            self.web_element.click()
        city_li = None
        cities = self.web_element.find_elements(self.locator['By'], "//ul//p-dropdownitem")
        while not city_li:
            for city in cities:
                if city.text == value_selected:
                    city_li = city
                    break
                else:
                    doc = self.driver.find_element(By.XPATH, f'//div/following-sibling::div/ul/cdk-virtual-scroll-viewport')
                    WebDriverWait(self.web_element, 30).until(EC.visibility_of((doc)))
                    self.driver.execute_script("arguments[0].scrollBy(0, 30);", doc)
        WebDriverWait(self.web_element, 30).until(EC.element_to_be_clickable((city_li))).click()
        return True

