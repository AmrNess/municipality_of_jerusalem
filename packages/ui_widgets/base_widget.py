from selenium.common import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as ec


class BaseWidget(object):
    def __init__(self, label):
        self.label = label
        self.web_element = None

    def set_web_element(self, web_element):
        self.web_element = web_element

    def get_web_element(self):
        return self.web_element

    @property
    def is_enable(self):
        return self.web_element.is_enabled()

    @property
    def get_text(self):
        return self.web_element.text

    @property
    def is_clickable(self):
        return all([ec.element_to_be_clickable(self.web_element), self.is_displayed])

    @property
    def is_displayed(self):
        return self.web_element.is_displayed()

    def item_is_displayed(self, element):
        try:
            self.web_element.find_element(by=By.XPATH, value=f"{element}")
            return True
        except NoSuchElementException:
            return False

    def get_text_allert_label(self):
        try:
            return  self.web_element.find_element(by=By.XPATH, value=f'.//following-sibling::div/div').text
        except NoSuchElementException:
            raise AssertionError("No alert field")



    def allert_label_is_displayed(self):
        try:
            self.web_element.find_element(by=By.XPATH , value= f'.//following-sibling::div[@role="alert"]')
            return True
        except NoSuchElementException:
            return False
