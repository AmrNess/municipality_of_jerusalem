from infra import logger, reporter
from screens.forms import confirmation_for_structure, placeContainer, eduInstituteRegistration, parking
from screens.forms import freedomInfo


log = logger.get_logger(__name__)
rep = reporter.get_reporter()


class ScreensFactory(object):
    '''Class handles all screens objects creation, which was taken out from all scripts.
    Holds a list of available objects already exists, and maintains this list according to test progress.'''

    def __init__(self):
        self.screens = {}
    #objects_list: the screens list, store_screen: if you want to save it in the dict, force_create:foce to create it
    def create_screen(self, objects_list=None, store_screen=True, force_create=False, driver=None):
        '''function gets a list of all objects to create (SuperRack/Mixer/ProTools/Cubase/SGMonitor)
            sets all required params, create the object, if not already in self.apps, and add it to this list if necessary.
            Returns the objects list back to the script for its use of running a test.'''

        screens_dict = {
            'ConfirmationForStructure': confirmation_for_structure.ConfirmationForStructure,
            'FreedomInfo': freedomInfo.FreedomInfo,
            'PlaceContainer': placeContainer.PlaceContainer,
            'EduInstituteRegistration': eduInstituteRegistration.EduInstituteRegistration,
            'Parking': parking.Parking
        }

        screens = []
        for screen_name in objects_list:
            # Creating new object
            # if the screen that we want to create is not in the dict, or it's not in the force create list then create it again
            if screen_name not in self.screens.keys() or force_create:
                log.info('-' * 150)
                log.info('Creating %s screen obj' % screen_name)
                screen = screens_dict[screen_name](driver)
                #if store_screen is true then save it in the screen dict
                if store_screen:
                    #example : 'ConfirmationForStructure': confirmation_for_structure.ConfirmationForStructure,
                    self.screens[screen_name] = screen
            # Getting existing object from list
            else:
                screen = self.screens[screen_name]

            # Setting list of objects to return
            if screen is not None:
                screens.append(screen)

        if len(screens) == 1:
            return screens[0]
        return screens
