from screens.forms.base_page import BasePage


# not working link : https://jeronlineforms.jerusalem.muni.il/EduInstituteRegistration
# working link : https://jereduforms.jerusalem.muni.il/EduInstituteRegistration


class EduInstituteRegistration(BasePage):
    def __init__(self, driver):
        super().__init__(driver)
        self.page_title = 'EduInstituteRegistration'
        self.url_postfix = 'EduInstituteRegistration'

        self.main_elements_to_wait_when_load = [

        ]
