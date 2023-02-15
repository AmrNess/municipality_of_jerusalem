import traceback
import uuid
import allure
from allure_commons.types import AttachmentType
from behave.model_core import Status
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager

from infra import reporter, logger, config

rep = reporter.get_reporter()
log = logger.get_logger(__name__)

# if there is a failed step in the scenario, the scenario will continue




def before_all(context):
    context._config.current_page = None
    browser = context.opt_dict.get('browser', 'chrome')
    if browser == 'chrome':
        context.driver = webdriver.Chrome(ChromeDriverManager().install())
        context.driver.implicitly_wait(10)


def before_scenario(context, scenario):
    scenario.starting_scenario_msg = f'----- Starting Scenario - {scenario.name} -----'
    log.info(scenario.starting_scenario_msg)
    scenario.continue_after_failed_step = True


def before_step(context, step):
    log.info(f'----- Starting Step - {step.name} -----')


def after_step(context, step):
    step_pass = True
    if step.status != Status.passed:
        step_pass = False
        log.exception(f'Exception type: {type(step.exception)}\n'
                      f'Exception: {step.exception}\n'
                      f'Exc_Traceback: {step.exc_traceback}')

    if not step_pass:
        log.debug(f'Take ScreenShot after failure for step {step.name}')
        screenshot = f'{context.result_folder_path}/screenshot_after_failure.png'
        context.driver.save_screenshot(screenshot)
        rep.add_image_to_step(screenshot, "ScreenShot After Failure")


def after_scenario(context, scenario):
    if scenario.status.name != 'passed':
        log_debug_file = [f['path'] for f in context.log_files if f['levelname'] == 'DEBUG'][0]
        with open(log_debug_file, 'r') as e:
            scenario_log = e.readlines()
        log_start_index = scenario_log.index(
            [i for i in reversed(scenario_log) if scenario.starting_scenario_msg in i][0])

        scenario_log_file = log_debug_file.replace('.txt', f'{uuid.uuid4().hex}.txt')
        with open(scenario_log_file, 'w') as e:
            e.write('\n'.join(scenario_log[log_start_index:-1]))
        try:
            rep.add_text_file_to_step(scenario_log_file, 'scenario log')
        except PermissionError as e:
            log.warning(f'{scenario_log_file} - {e.args[0]}')


def after_all(context):
    if context.driver:
        log.info('Close Browser')
        context.driver.quit()
