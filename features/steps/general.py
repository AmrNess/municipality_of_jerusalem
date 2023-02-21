import time

from behave import *
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from smart_assertions import soft_assert, verify_expectations

from infra import logger, reporter, config, custom_exceptions as ce

rep = reporter.get_reporter()
log = logger.get_logger(__name__)


@given('I navigate to "{screen_name}" page')
def navigate_to_screen(context, screen_name):
    # create a screen
    current_page = context.screens_manager.create_screen([screen_name], driver=context.driver)
    # check if we opened the browser and if yes check if the tittle we need is the one who opened , or if there is
    # no tittle opened then go to the url
    if (
            context._config.current_page and context._config.current_page.page_title != current_page.page_title) or context._config.current_page is None:
        context._config.current_page = current_page
        current_page.navigate_to_page_url()
        driver = current_page.driver
        for element in current_page.main_elements_to_wait_when_load:
            WebDriverWait(driver, 30).until(
                EC.presence_of_element_located((element.locator['By'], element.locator['Value'])))

    context._config.screen_name = screen_name


@when('I write "{text}" in "{widget_name}"')
def write_into_text_field(context, text, widget_name):
    """
    :param widget_name:
    :param text:
    :type context: behave.runner.Context
    """
    language = context._config.lang
    label = (config.input_form[widget_name][language])
    widget = context._config.current_page.widgets[label]
    # log.info("نشوف شو بجيب الليبل :")
    # log.info(config.input_form[widget_name])
    # label = (config.input_form[widget_name]['Arabic'])
    # log.info(lang_key)
    # widget = context.current_page.widgets[label]
    # log.info("نشوف شو صار بالويدجيت : "  + widget)
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    widget.set_text(text)


@when('I checked if "{text}" is the text of "{widget_name}"')
def check_text_field(context, text, widget_name):
    widget = context._config.current_page.widgets[widget_name]
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.check_text(text)


@then('field "{widget_name}" has invalid value')
def field_has_invalid_value(context, widget_name):
    """
    :param widget_name:
    :type context: behave.runner.Context
    """
    widget = context._config.current_page.widgets[widget_name]
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.is_invalid is True and widget.is_valid is False, "Field considered as valid"


@then('field "{widget_name}" has valid value')
def field_has_valid_value(context, widget_name):
    """
    :param widget_name:
    :type context: behave.runner.Context
    """
    widget = context._config.current_page.widgets[widget_name]
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.is_invalid is False and widget.is_valid is True, "Field considered as invalid"


@then('I click on "{widget_name}" button')
def click_button(context, widget_name):
    widget = context._config.current_page.widgets[widget_name]
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    widget.clickBtn()


@when('I check header')
def check_header(context):
    widget = context._config.current_page.widgets['header']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)


@then('the head should be displayed')
def is_header_displayed(context):
    head = context._config.current_page.widgets['header']

    def test_header():
        soft_assert(head.check_header_element('logo'), "no logo")
        soft_assert(head.check_header_element('text'), 'no text')
        soft_assert(head.check_header_element('arabic'), 'no arabic')
        soft_assert(head.check_header_element('hebrew'), 'no hebrow')
        verify_expectations()

    test_header()
    table_name = "HeaderResults"
    rep.add_table(table_name)
    rep.add_columns(table_name, ('col1', 'assert'), ('col2', 'log'))
    rep.add_row(table_name, ("assert: ", "log: " + log.info(test_header())))
    rep.add_table_to_step(table_name)


@when('I check footer')
def check_footer(context):
    widget = context._config.current_page.widgets['footer']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value2'])
        widget.set_web_element(web_element)


@then('the footer should be displayed')
def is_footer_displayed(context):
    footer = context._config.current_page.widgets['footer']

    def test_footer():
        soft_assert(footer.check_footer_element('customer_service'), "no customer service")
        soft_assert(footer.check_footer_element('Privacy'), "no Privacy ")
        soft_assert(footer.check_footer_element('Terms_of_Service'), "no Terms of Service'")
        verify_expectations()

    test_footer()
    table_name = "footerResult"
    rep.add_table(table_name)
    rep.add_columns(table_name, ('col1', 'assert'), ('col2', 'log'))
    rep.add_table_to_step(table_name)


@When('I click on "{widget_name}" btn')
def click_button(context, widget_name):
    widget = context._config.current_page.widgets[widget_name]
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    widget.clickBtn()


@then('close the menu')
def close_menu(context):
    widget = context._config.current_page.widgets['SpecialNeeds']
    if widget.get_web_element() is None:
        web_element = WebDriverWait(context._config.current_page.driver, config.implicit_wait).until(
            EC.element_to_be_clickable((widget.locator['By'], widget.locator['Value'])))
        widget.set_web_element(web_element)
    widget.clickBtnMenu()


@When('I picked value "{prefix_value}" and "{widget_name}"')
def select_Number(context, widget_name, prefix_value):
    widget = context._config.current_page.widgets[widget_name]
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    time.sleep(1)
    result = widget.pick_element(prefix_value)
    log.info("result is: " + result + " ?== prefix value " + prefix_value)
    assert result == prefix_value


@When('I search value "{search_value}" and "{widget_name}"')
def search_city(context, widget_name, search_value):
    widget = context._config.current_page.widgets[widget_name]
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value2'])
        widget.set_web_element(web_element)
    result = widget.search_element(search_value)
    log.info("result is: " + result + " ?== search_value " + search_value)
    assert result == search_value


@When('I choic id value "{idtype_value}" and "{widget_name}"')
def select_id(context, widget_name, idtype_value):
    widget = context._config.current_page.widgets[widget_name]
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value2'])
        widget.set_web_element(web_element)
    result = widget.pick_element(idtype_value)
    log.info("result is: " + result + " ?== idtype " + idtype_value)
    assert result == idtype_value


@Then('check if the "{widget_name}" error is "{error_expectation}"')
def error_field(context, widget_name, error_expectation):
    widget = context._config.current_page.widgets[widget_name]
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value2'])
        widget.set_web_element(web_element)

    if config.text_error[error_expectation] in widget.get_text_allert_label():
        log.info(
            f"the allert msg: {config.text_error[error_expectation]} is = in the allert error: {widget.get_text_allert_label()}")
    else:
        raise AssertionError(
            f"the allert msg: ({config.text_error[error_expectation]}) doesn't = in the allert error: ({widget.get_text_allert_label()})")


@When('I check that the page number is  "{number:d}"')
def current_page_number(context, number):
    widget = context._config.current_page.widgets['PageNumber']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    widget.check_pages_numbers(number)


@Then('Am I in page "{number}"')
def current_page_number(context, number):
    widget = context._config.current_page.widgets['PageNumber']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    widget.check_current_page(number)


@Then('I check the language is "{lang}"')
def current_lang(context, lang):
    widget = context._config.current_page.widgets['Langauge']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
        log.info(
            f"the languge we check: {lang} , the language is choices: {widget.check_lang()}")
    assert widget.check_lang() == lang, f"page languge does not equal {lang}"


@When('I switch the language to "{lang}"')
def switch_lang(context, lang):
    log.info(f"the context._config now is : {config.langauge}")
    log.info(f"the lang now is : {lang}")
    langauge = config.langauge[f"{lang}"]
    log.info(f"the context._config now is : {langauge}")
    widget = context._config.current_page.widgets['changeLangauge']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
        if widget.check_lang() == lang:
            log.info(f"we are in the correct page we need : {lang}")
        else:
            log.info(
                f"the languge we need: {lang} , the language is choices: {widget.check_lang()} , "
                f"so we changes this to {lang} ")
    widget.change_lang(langauge)
    time.sleep(2)
    context._config.lang = lang
    current_page = context.screens_manager.create_screen([context._config.screen_name], driver=context.driver,
                                                         force_create=True, language=lang)


@When('I scroll to value "{prefix_value}" and "{widget_name}"')
def scroll_value(context, widget_name, prefix_value):
    widget = context._config.current_page.widgets[widget_name]
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value2'])
        widget.set_web_element(web_element)
    assert widget.scroll_for_ellemnt(prefix_value), "Error, the selected address is not available"


### new header ####
@when('check the header tittle')
def header_new_tittle_check(context):
    widget = context._config.current_page.widgets['titleHeader']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.check_header_tittle(), "Error, Incorrect expectation tittle"


@when('check the header logo')
def header_new_logo_check(context):
    widget = context._config.current_page.widgets['titleHeader']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.check_header_picture(), "Error, Incorrect expectation logo"


@when('check the header application name is "{appName}"')
def header_new_application_name_check(context, appName):
    widget = context._config.current_page.widgets['titleHeader']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.check_header_application_name(appName), "Error, Incorrect expectation application name"


@when('check the header status text')
def header_new_tittle_status_text(context):
    widget = context._config.current_page.widgets['titleHeader']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'],
                                                                       widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.check_header_status_text(), "Error, Incorrect expectation tittle status text"


@when('check the header status date')
def header_new_tittle_date(context):
    widget = context._config.current_page.widgets['titleHeader']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'],
                                                                       widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.check_header_status_date_text(), "Error, Incorrect expectation tittle date status"


@when('check the date')
def form_date(context):
    widget = context._config.current_page.widgets['titleHeader']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'],
                                                                       widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.check_form_date(), "Error, Incorrect date"


@when('check the status is "{status}"')
def form_date(context, status):
    widget = context._config.current_page.widgets['titleHeader']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'],
                                                                       widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.check_form_status(status), "Error, Incorrect status form"


@When('I check that the buttons count is  "{number:d}"')
def buttons_count(context, number):
    widget = context._config.current_page.widgets['titleHeader']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    widget.check_header_buttons_count(number)


@Then('I click on header "{btn_name}" button')
def click_button(context, btn_name):
    widget = context._config.current_page.widgets['titleHeader']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    widget.click_btn_header(btn_name)


@when('check the explanation area')
def explanation_area_check(context):
    widget = context._config.current_page.widgets['titleHeader']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'],
                                                                       widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.check_header_explanation_area(), "Error, No explanation area"


@when('check the explanation tittle')
def explanation_tittle_check(context):
    widget = context._config.current_page.widgets['titleHeader']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'], widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.check_header_explanation_title(), "Error, Incorrect expectation tittle"


@when('check the explanation body')
def explanation_body_check(context):
    widget = context._config.current_page.widgets['titleHeader']
    if widget.get_web_element() is None:
        web_element = context._config.current_page.driver.find_element(widget.locator['By'],
                                                                       widget.locator['Value'])
        widget.set_web_element(web_element)
    assert widget.check_header_explanation_text(), "Error, No explanation body"


