from selenium.webdriver.common.by import By
from ui_widgets.base_widget import BaseWidget
from selenium.webdriver.common.alert import Alert
from infra import logger

log = logger.get_logger(__name__)


class New_Header_field(BaseWidget):
    def __init__(self, label, driver):
        super().__init__(label)
        self.driver = driver
        self.alert = Alert(driver)


    @property
    def get_text(self):
        return self.web_element.text

    @property
    def locator(self):
        return {
            'By': By.XPATH,
            'Value': f"//core-header"
        }

    def get_header_tittle(self):
        header_tittle = self.web_element.find_element(by=By.XPATH, value=f"./nav/div/span")
        return header_tittle.text

    def check_header_tittle(self, expected_tittle):
        return self.get_header_tittle() == expected_tittle

    def check_header_picture(self):
        header_logo = self.web_element.find_element(by=By.XPATH, value=f"./nav/div/following-sibling::div/a/img")
        return header_logo.is_displayed()

    def check_header_application_name(self, app_name):
        return self.get_header_application_name() == app_name

    def get_header_application_name(self):
        application_name = self.web_element.find_element(by=By.XPATH, value=f"./nav/following-sibling::div")
        return application_name.text

    def get_header_status(self):
        header_status = self.web_element.find_element(by=By.XPATH, value=f"./nav/following-sibling::div/following-sibling::div/div/div")
        return header_status.text

    def check_header_status(self, expected_status):
        return expected_status == self.get_header_status()

    def get_header_paper_filled(self):
        header_status = self.web_element.find_element(by=By.XPATH, value=f"./nav/following-sibling::div/following-sibling::div/div/div/following-sibling::div")
        return header_status.text

    def check_header_paper_filled(self, expected_date):
        return expected_date == self.get_header_paper_filled()

    def get_info_tab_content(self):
        info_tab_content = self.web_element.find_element(by=By.XPATH, value=f"//div[contains(@class,'ng-trigger ng-trigger-animation ng-tns-c36-1 ui-dialog ui-widget ui-widget-content ui-corner-all ui-shadow ui-dialog-draggable ui-dialog-resizable ng-star-inserted')]/div/following-sibling::div")
        return info_tab_content.text

    # def check_info_tab_content(self, expected_info_tab_content):
    #     return self.get_info_tab_content() == expected_info_tab_content

    def check_info_tab_content(self):
        return len(self.get_info_tab_content()) > 20

    def close_info_tab(self):
        close_btn = self.web_element.find_element(by=By.XPATH, value=f"//div[contains(@class,'ng-trigger ng-trigger-animation ng-tns-c36-1 ui-dialog ui-widget ui-widget-content ui-corner-all ui-shadow ui-dialog-draggable ui-dialog-resizable ng-star-inserted')]/div/div/a")
        close_btn.click()

    def get_application_explanation_tittle(self):
        explanation_tittle = self.web_element.find_element(by=By.XPATH, value=f"./nav/following-sibling::div/following-sibling::div/following-sibling::div/div")
        return explanation_tittle.text

    def check_application_explanation_tittle(self, expected_explanation_tittle):
        return self.get_application_explanation_tittle() == expected_explanation_tittle

    def get_application_explanation_content(self):
        explanation_tittle = self.web_element.find_element(by=By.XPATH, value=f"./nav/following-sibling::div/following-sibling::div/following-sibling::div/div/following-sibling::div")
        return explanation_tittle.text

    # def check_application_explanation_content(self, expected_explanation_content):
    #     return self.get_application_explanation_content() == expected_explanation_content

    def check_application_explanation_content(self):
        return len(self.get_application_explanation_content()) > 20

    def accept_alert(self):
        self.alert.accept()


    def cancel_print(self):
        # self.driver.execute_script('document.querySelector("body > print-preview-app").shadowRoot.querySelector("#sidebar").shadowRoot.querySelector("print-preview-button-strip").shadowRoot.querySelector("div > cr-button.cancel-button").click();')

        self.driver.execute_script('document.querySelector("body > print-preview-app").shadowRoot.querySelector("print-preview-sidebar").shadowRoot.querySelector("print-preview-button-strip").shadowRoot.querySelector("div > cr-button.cancel-button").click();')













