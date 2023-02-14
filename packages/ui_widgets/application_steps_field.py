from selenium.webdriver.common.by import By
from ui_widgets.base_widget import BaseWidget
from infra import logger

log = logger.get_logger(__name__)


class Application_steps_field(BaseWidget):
    def __init__(self, label):
        super().__init__(label)


    @property
    def get_text(self):
        return self.web_element.text

    @property
    def locator(self):
        return {
            'By': By.XPATH,
            'Value': f"//core-stepper"
        }

    def get_app_steps_tittle(self):
        steps_tittle = self.web_element.find_element(By.XPATH, "./div/div")
        return steps_tittle.text

    def check_app_steps_tittle(self, expected_tittle):
        return self.get_app_steps_tittle() == expected_tittle

    def get_steps_amount(self):
        steps = self.web_element.find_elements(By.XPATH, "./div/div")
        return len(steps) - 1

    def step_checker(self, expected_step):
        step = self.web_element.find_element(By.XPATH, f".//following-sibling::div/span[contains(text(),'{expected_step}')]/parent::div")
        if "active" in step.get_attribute('class'):
            return True
        else:
            return False

    def get_step_name(self):
        steps = self.web_element.find_elements(By.XPATH, "./div/div")
        for step in steps:
            if "active" in step.get_attribute('class'):
                return step.text
        return -1






