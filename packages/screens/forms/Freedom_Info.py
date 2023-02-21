from screens.forms.base_page import BasePage
from ui_widgets.dropdownSearch_field import dropDownSearch
from ui_widgets.dropdown_field import dropDown
from ui_widgets.mobile_field import Mobile_Field
from ui_widgets.page_number import PageNumber
from ui_widgets.text_field import TextField
from infra import logger, reporter, config, custom_exceptions as ce
from infra import logger, reporter, config, custom_exceptions as ce

rep = reporter.get_reporter()
log = logger.get_logger(__name__)

class FreedomInfo(BasePage):
    def __init__(self, driver,language):
        super().__init__(driver,language)
        self.page_title = 'FreedomInfo'
        self.url_postfix = 'FreedomInfo'
        log.info(f"the languge in page : {language}")
        self.widgets['שם פרטי'] = TextField(config.input_form.get('שם פרטי').get(language))
        self.widgets['שם משפחה'] = TextField(config.input_form.get('שם משפחה').get(language))
        # self.widgets['שם פרטי'] = TextField(config.input_form.get('שם פרטי').get(self.language))
        # self.widgets['שם משפחה'] = TextField(config.input_form.get('שם משפחה').get(self.language))
        self.widgets['שם פרטי'] = TextField('שם פרטי')
        self.widgets['שם משפחה'] = TextField('שם משפחה')
        self.widgets['מספר ת.ז.'] = TextField('מספר ת.ז.')
        self.widgets['טלפון נייד'] = Mobile_Field('טלפון נייד')
        self.widgets['טלפון קווי'] = Mobile_Field('טלפון קווי')
        self.widgets['דוא"ל'] = TextField('דוא"ל')
        self.widgets['dropDownPhone'] = dropDown('טלפון נייד')
        self.widgets['dropDownTel'] = dropDown('טלפון קווי')
        self.widgets['יישוב'] = dropDownSearch('יישוב' , driver)
        self.widgets['רחוב:'] = dropDownSearch('רחוב:' , driver)
        self.widgets['סוג זיהוי'] = dropDown('סוג זיהוי')
        self.widgets['מספר בית'] = TextField('מספר בית')
        self.widgets['מיקוד'] = TextField('מיקוד')
        self.widgets['PageNumber'] = PageNumber('PageNumber')
        self.main_elements_to_wait_when_load = [
            self.widgets['שם פרטי'],
            self.widgets['המשך']
        ]

