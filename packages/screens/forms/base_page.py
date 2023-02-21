from ui_widgets.btn_field import BtnField
from ui_widgets.footer import Footer
from ui_widgets.header import Header
from ui_widgets.header_new import Header_new
from ui_widgets.langauge import Langauge
from ui_widgets.special_needs import SpecialNeeds


class BasePage(object):
    def __init__(self, driver):
        # self.language = language
        self.driver = driver
        self.main_url = 'https://jeronlineforms.jerusalem.muni.il/'
        self.url_postfix = ''
        self.widgets = {}
        self.widgets['header']= Header('header')
        self.widgets['titleHeader']= Header_new('titleHeader')
        self.widgets['footer']= Footer('footer')
        self.widgets['המשך'] = BtnField('המשך')
        self.widgets['SpecialNeeds'] = SpecialNeeds('SpecialNeeds')
        self.widgets['SpecialNeedsMenu'] = SpecialNeeds('SpecialNeedsMenu')
        self.widgets['Langauge'] = Langauge('Langauge')
        self.widgets['changeLangauge'] = Langauge('changeLangauge')
        self.main_elements_to_wait_when_load = []


    def navigate_to_page_url(self):
        self.driver.get(self.main_url + self.url_postfix)