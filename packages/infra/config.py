import os
import sys
import socket
import platform

auto_depot_path = os.path.abspath(os.path.join(__file__, os.pardir, os.pardir, os.pardir))
utilities_folder = os.path.join(auto_depot_path, 'utilities')

hour_format = '%H:%M:%S'
date_format = '%d-%b-%Y'
time_format = '%d-%m-%y_%H-%M'  # This format is used in file and folder names
pretty_time_format = '%d/%m/%y %H:%M'
full_time_format = '%d-%b-%Y %H:%M:%S'

if sys.platform == 'darwin':
    current_os = 'Mac'
    applications_exec = '.app'
    temp_folder = '/tmp'
    platform_machine = 'Mac'
    if 'RELEASE_ARM64' in platform.uname().version:
        platform_machine = 'ARM'
elif sys.platform == 'win32' and platform.architecture()[0] == '64bit':
    current_os = 'Win'
    try:
        is_windows_11 = sys.getwindowsversion().build > 20000
    except:
        is_windows_11 = False
    applications_exec = '.exe'
    trash_path = os.path.join('C:\$Recycle.Bin')
    temp_folder = os.environ['TMP']
    platform_machine = 'Win'
else:
    current_os = 'Linux'
    platform_machine = 'Linux'


client_name = socket.gethostname().replace('.local', '')
user_desktop = os.path.join(os.path.expanduser('~'), 'Desktop')
user_download = os.path.join(os.path.expanduser('~'), 'Downloads')
allure_utils_path = os.path.join(utilities_folder, 'allure')
if current_os == 'Win':
    local_allure_executable = os.path.join(allure_utils_path, 'bin', 'allure.bat')
else:
    local_allure_executable = os.path.join(allure_utils_path, 'bin', 'allure')


implicit_wait = 10


text_error={
    "Must to enter value" : "שדה חובה",
    "value not in hebrew" : "יש להזין אותיות בעברית בלבד ותווים מיוחדים",
    "id not valid" : "מספר זהות לא תקין",
    "not full number phone" : "יש להזין ספרות בלבד  יש להשלים את הספרות החסרות" ,
    "must to be number" : "יש להזין ספרות בלבד",
    "email error" : "שדה לא תקין",
}


langauge = {
    'Arabic' : 'العربية' ,
    'Hebrew' : 'עברית'
}
# langauge = {
#     'العربية' : 'Arabic' ,
#     'עברית' : 'Hebrew'
# }


input_form= {
    'שם פרטי' : {'Arabic' : 'الاسم الشخصي' , 'Hebrew' : 'שם פרטי'},
    'שם משפחה' : {'Arabic' : 'اسم العائلة' , 'Hebrew' : 'שם משפחה'},
    'סוג זיהוי' : {'Arabic' : 'نوع الهوية' , 'Hebrew' : 'סוג זיהוי'},
    'מספר ת.ז.' : {'Arabic' : 'رقم الهوية' , 'Hebrew' : 'מספר ת.ז.'},
    'טלפון נייד' : {'Arabic' : 'هاتف محمول' , 'Hebrew' : 'טלפון נייד'},
    'טלפון קווי' : {'Arabic' : 'هاتف ' , 'Hebrew' : 'טלפון קווי'},
    'דוא"ל' : {'Arabic' : 'البريد الالكتروني' , 'Hebrew' : 'דוא"ל'},
    'יישוב' : {'Arabic' : 'المدينة' , 'Hebrew' : 'יישוב'},
    'רחוב' : {'Arabic' : 'شارع: ' , 'Hebrew' : 'רחוב: '},
    'מספר בית' : {'Arabic' : 'رقم البيت' , 'Hebrew' : 'מספר בית'},
    'מיקוד' : {'Arabic' : 'الرمز البريدي' , 'Hebrew' : 'מיקוד'},
    'המשך' : {'Arabic' : 'اكمل ' , 'Hebrew' : 'המשך '},
    'ת.ז.' : {'Arabic' : 'الهوية ' , 'Hebrew' : 'ת.ז.'},
    'דרכון' : {'Arabic' : 'جواز السفر' , 'Hebrew' : 'דרכון'}
}

