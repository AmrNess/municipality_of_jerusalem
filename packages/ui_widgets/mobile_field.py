from selenium.webdriver.common.by import By

from infra import logger, custom_exceptions as ce
from ui_widgets.text_field import TextField

log = logger.get_logger(__name__)


class Mobile_Field(TextField):
    def __init__(self, label, path_locator="following-sibling::div/input"):
        super().__init__(label,path_locator)

