from datetime import datetime
from time import sleep

from selenium import webdriver
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.core import driver
from selenium.webdriver.common.by import By
from ui_widgets.base_widget import BaseWidget
from infra import logger

log = logger.get_logger(__name__)


class Header_new(BaseWidget):
    def __init__(self, label):
        super().__init__(label)

    @property
    def get_text(self):
        return self.web_element.text

    @property
    def locator(self):
        return {
            'By': By.XPATH,
            'Value': f"//core-header",
        }

    #### header tittle ####
    def check_header_tittle(self):
        log.info("Get Header tittle text")
        header_tittle = self.web_element.find_element(by=By.XPATH,
                                                      value=f"//nav//div//span").text
        log.info(header_tittle)
        log.info(f'Check if Header tittle text is שרותים דיגיטליים')
        return header_tittle == 'שרותים דיגיטליים'

    #### header logo #####
    def check_header_picture(self):
        log.info("Check if  Header picture is available")
        header_logo = self.web_element.find_element(by=By.XPATH,
                                                    value=f"//img[@class='desktop-logo']")
        return header_logo.is_displayed()

    ##### header form name #####
    def check_header_application_name(self, app_name):
        application_name = self.web_element.find_element(by=By.XPATH, value=f"//div[@class='form-title']//h1").text
        log.info(f'Get Header Application name :  {application_name}')
        log.info(f'Check if Application name is :  {app_name}')
        return application_name == app_name

    ###### header status #####
    def check_header_status_text(self):
        log.info("Get Header tittle status")
        header_tittle_status = self.web_element.find_element(by=By.XPATH,value=f"//div[@class='form-status']//div[1]//span").text
        log.info(header_tittle_status)
        log.info(f'Check if Header tittle status text is סטטוס:')
        return header_tittle_status == 'סטטוס:'

    def check_header_status_date_text(self):
        log.info("Get Header tittle status")
        header_tittle_status_date_text = self.web_element.find_element(by=By.XPATH,
                                                                       value=f"//div[@class='form-status']//div[2]//span").text
        log.info(header_tittle_status_date_text)
        log.info(f'Check if Header tittle status text is תאריך מילוי הטופס:')
        return header_tittle_status_date_text == 'תאריך מילוי הטופס:'

    def check_form_date(self):
        now = datetime.now()
        date = now.strftime("%d/%m/%Y")
        log.info("Get Form Date")
        form_date = self.web_element.find_element(by=By.XPATH, value='//*[@class="form-status"]//div[2]').text.split(": ", 1)[1]
        log.info(form_date)
        log.info(f'the current date now is :  {date}')
        return form_date == date

    def check_form_status(self , label):
        log.info("Get Form status")
        status = self.web_element.find_element(by=By.XPATH, value='//*[@class="form-status"]//div[1]').text.split(": ", 1)[1]
        log.info(f'the status is :{status}')
        log.info(f'the label you send is :{label}')
        return status == label



    ##### header buttons #####
    def check_header_buttons_count(self,number):
        count_btn= self.web_element.find_elements(by=By.XPATH, value=f"//div[@class='actions-row']/button")
        log.info(f"number of buttons is '{len(count_btn)}'")
        assert len(count_btn) == number,f'buttons not equal, the correct buttons is {len(count_btn)} , you enterd {number}'

    def click_btn_header(self,label):
        btn = self.web_element.find_element(by=By.XPATH,
                                                    value=f"//button[@title='{label}']//i")
        log.info(f"the button you clicked is : {label}")
        btn.click()
        try:
            info = self.web_element.find_element(by=By.XPATH,
                                                value=f"//div[contains(@class,'ui-dialog-content')]")
            WebDriverWait(driver, 30).until(EC.visibility_of((info)))
            log.info(info.text)
            check_text = 'טופס זה הוא טופס מקוון, והוא יאפשר לך להגיש את הבקשה באופן ממוחשב, לזכות בעדכון לגבי מצב הטיפול בטופס, לצרף מסמכים חסרים ככל שידרשו וכן לקבל הודעה על גמר הטיפול בבקשה, והכל דרך כתובת הדוא"ל, ובלי צורך להגיע למשרדי העירייה'
            if check_text in info.text:
                log.info("correct parghraph")
            else:
                log.info("Not correct parghraph")

        except:
            log.info("no info text for this btn")


    def clickclose(self):
        element = self.web_element.find_element(By.XPATH, "//a[contains(@class, 'close')]")
        WebDriverWait(driver, 30).until(EC.visibility_of((element))).click()

    # def clickclosePrint(self):
    #     element = self.web_element.find_element(By.XPATH, "//cr-button[contains(@class, 'cancel-button')]")
    #     WebDriverWait(driver, 30).until(EC.visibility_of((element))).click()



    #### header explanation ######

    def check_header_explanation_area(self):
        log.info(f'Check if header explanation aera is available')
        explanation = self.web_element.find_element(by=By.XPATH,
                                                    value=f"//div[contains(@class, 'explain')]")
        return explanation.is_displayed()

    def check_header_explanation_title(self):
        log.info("Get Header explanation title")
        explanation_title = self.web_element.find_element(by=By.XPATH,value=f"//div[contains(@class,'form-section-title')]").text
        log.info(f'Check if explanation tittle text is הסבר למילוי הטופס:')
        log.info(f"what we get from website is : {explanation_title}")
        return explanation_title == 'הסבר למילוי הטופס:'


    def check_header_explanation_text(self):
        log.info("Get Header explanation text")
        explanation_text = self.web_element.find_element(by=By.XPATH,value=f"//div[@class='explain ng-star-inserted']//div[2]")
        log.info(explanation_text.text.split("\n"))
        return explanation_text.is_displayed()
