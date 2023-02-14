from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from infra import logger, config
from ui_widgets.dropDown_field import DropDown_field

log = logger.get_logger(__name__)


class SelectInputField(DropDown_field):
    def __init__(self, label, driver):
        super().__init__(label)
        self.driver = driver

    @property
    def locator(self):
        return {
            'By': By.XPATH,
            'Value': f"//label[contains(text(),'{self.label}')]/following-sibling::p-dropdown/div/span"
        }

    def select_input_after_writing(self, input):
        if self.Check_if_expanded:
            self.web_element.click()

        input_text = self.web_element.find_element(By.XPATH, f"//following-sibling::div/following-sibling::div//input")
        input_text.clear()
        input_text.send_keys(input)

        elements = self.web_element.find_elements(By.XPATH,
                                                  "//div/following-sibling::div/ul/cdk-virtual-scroll-viewport/div/p-dropdownitem/li")
        for element in elements:
            if element.text == input:
                WebDriverWait(self.web_element, config.explicit_wait).until(EC.element_to_be_clickable((element))).click()
                return element.text
        return "-1"

    def select_input_without_writing(self, input):
        if self.Check_if_expanded:
            self.web_element.click()

        city_li = None
        cities = self.web_element.find_elements(self.locator['By'], "//ul//p-dropdownitem")
        while not city_li:
            for city in cities:

                if city.text == input:
                    city_li = city
                    break
                else:
                    doc = self.driver.find_element(By.XPATH,
                                                   f'//div/following-sibling::div/ul/cdk-virtual-scroll-viewport')
                    self.driver.execute_script("arguments[0].scrollBy(0, 30);", doc)
        WebDriverWait(self.web_element, config.explicit_wait).until(EC.element_to_be_clickable((city_li))).click()
        return True
