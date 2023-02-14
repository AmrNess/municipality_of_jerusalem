from screens.forms.base_page import BasePage
from ui_widgets.big_btn_field import BigBtnField


class Parking(BasePage):
    def __init__(self, driver):
        super().__init__(driver)
        self.page_title = 'Parking'
        self.url_postfix = 'Parking'
        self.widgets['זהות'] = BigBtnField('זהות')
        self.widgets['רכב/דוח'] = BigBtnField('רכב/דוח')

        self.main_elements_to_wait_when_load = [

        ]
