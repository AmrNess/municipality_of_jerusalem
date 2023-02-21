Feature: header, fields test of BusinessLicenseExists Form Page


  """
  - Feature file name: businessLicenseExists_page_5.feature
  - Form link: https://jeronlineforms.jerusalem.muni.il/BusinessLicenseExists
  - Number of Pages is : 11, We are at Page: 5
  - page name : עזיבת שותף
  - mandatory fields are: סוג זיהוי, מספר מזהה, שם פרטי, שם משפחה, ישוב, רחוב, מס' בית, טלפון נייד, צרופות
  """

  @header
  Scenario: Check explanation of form
    Given I navigate to "BusinessLicenseExists" page
    Then Is application information tittle is "הסבר למילוי הטופס:"
    And Check if application explanation have text

  @header
  Scenario: Check Print display
    Given I navigate to "BusinessLicenseExists" page
    When I click on "הדפס" button
    And Check if Print display is clear

  @form
  Scenario : full scenario for the page test (valid)
    Given I navigate to "BusinessLicenseExists" page
    When Click On "+" sign in "הוספת בעלים"
    And Choose "פרטי" in "סוג"
    And Choose "תעודת זהות" in "סוג זיהוי"
    And I write "332796184" in "מספר מזהה"
    And I write "פראס" in "שם פרטי"
    And I write "אבו סנינה" in "שם משפחה"
    And I pick "ירושלים" in "ישוב"
    And I pick "א - זבאדי" in "רחוב"
    And I write "2" in "מספר בית"
    And I write "אור" in "כניסה"
    And I write "1312321" in "מיקוד"
    And I write "0528076374" in "טלפון נייד"
    And I write "firas@ab.com" in "דוא"ל"
    And Click On "הוספת קובץ" sign in "ת.ז. בעל העסק"
    Then Check if the "the_first_file" name is allowed
    And Check if the "the_first_file" type is allowed
    And Check if the "the_first_file" size is allowed
    And Pick the file
    And I click on "שמור" button
    And validate that field "סוג" has "פרטי"
    And validate that field "סוג זיהוי" has "תעודת זהות"
    And validate that field "שם פרטי" has "פראס"
    And validate that field "שם משפחה" has "אבו סנינה"
    And validate that field "ישוב" has "ירושלים"
    And validate that field "רחוב" has "א - זבאדי"
    And validate that field "מספר בית" has "2"
    And validate that field "כניסה" has "אור"
    And validate that field "מיקוד" has "1312321"
    And validate that field "מספר טלפון נייד" has "0528076374"
    And validate that field "דוא"ל" has "firas@ab.com"
    And validate that field "ת.ז. בעל העסק" has "the_first_file"



  @form
  Scenario : Check if the mandatory are invalid
    Given I navigate to "BusinessLicenseExists" page
    When I click on "המשך" button
    Then Validate that we are in step "הוספת / עזיבת שותף" of the page
    And Check if "סוג זיהוי" has "יש לציין סוג מזהה" error message
    And Check if "מספר מזהה" has "יש להזין מספר זהות" error message
    And Check if "שם פרטי" has "יש למלא שם פרטי" error message
    And Check if "שם משפחה" has "יש למלא שם משפחה" error message
    And Check if "ישוב" has "חובה לבחור ישוב" error message
    And Check if "רחוב" has "יש לצייו רחוב" error message
    And Check if "מס' בית" has "יש לציין מסםר בית" error message
    And Check if "טלפון נייד" has "יש להזין מספר טלפון נייד" error message
    And Check if "ת.ז. בעל העסק" has "חובה לצרף קובץ" error message


  @form
  Scenario Outline: id value test (valid)
    Given I navigate to "BusinessLicenseExists" page
    When I write "<id>" in "מספר מזהה"
    Then Check field "מספר מזהה" has valid value
    Examples:
    | id        |
    | 331212324 |
    | 223344557 |
    | 112233440 |
    | 223311440 |
    | 111111100 |
    | 223344557 |
    | 223342239 |
    | 533456745 |
    | 121212120 |
    | 008800880 |
    | 433243433 |
    | 752123133 |
    | 165786534 |


  @form
  Scenario Outline: id invalid values test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<id>" in "מספר מזהה"
    Then Check field "מספר מזהה" has invalid value
    And Check if error message of "מספר מזהה" is "מספר זהות לא תקין"
    Examples:
    | id                           |
    | 000000001                    |
    | 000000118                    |
    | 000000009                    |
    | 3121                         |
    | 34379818234336234724282      |
    | 92443232                     |
    | salem12321342133             |
    | salem12343457893r44677458    |
    | 83427961833                  |
    | 3219                         |
    | 8883                         |
    | 0157                         |
    | 0180                         |
    | 22345556754                  |
    | 23e23444322343355            |
    | 33sham344557895              |
    | 33ק'/דגגבשד344554897          |
    | 33ק'سببسث344567897            |
    | 33ק'/דגגכבבשד34557897         |
    | 33!@#$%3445765897            |
    | 33زسيhhjכעיח!@#$%344557457    |
    | 331133232ssd24312233         |
    | 01                           |
    | 231312324                    |
    | 453344553                    |
    | 612235427                    |
    | 322314466                    |
    | 613167101                    |
    | 213141517                    |
    | 293942999                    |
    | 135416541                    |
    | 224222424                    |
    | 108102581                    |
    | 233243236                    |
    | 154528136                    |
    | 160786030                    |

  @form
  Scenario Outline: id invalid values test (BUG)
    Given I navigate to "BusinessLicenseExists" page
    When I write "<id>" in "מספר מזהה"
    Then Check field "מספר מזהה" has invalid value
    And Check if error message of "מספר מזהה" is "מספר זהות לא תקין"
    Examples:
    | id                            |
    | 000000000                     |
    | 000000018                     |
    | 3327981827336443728282        |
    | 33279618433                   |
    | 22345567754                   |
    | 331133232ssd2321312233        |
    | 00                            |
    | 12321323142133                |
    | 12345678934567467788998       |
    | 2323443211343355              |
    | 33344557897                   |

  @form
  Scenario Outline: first name, last name valid values test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<first_name>" in "שם פרטי"
    And I write "<last_name>" in "שם משפחה"
    Then Check field "שם פרטי" has valid valid
    And Check field "שם משפחה" has valid valid
    And Validate that "שם פרטי" have the input only Hebrew with the allowed signs
    And Validate that "שם משפחה" have the input only Hebrew with the allowed signs
    Examples:
    | first_name  | last_name    |
    | פראס         | א-בו דגככ    |
    | שדכשד__שדג   | שדגשד)(גשדג   |
    | שדג_שגדג     | שדגשדג       |
    | דכ.כשכד      | דשכשד)כדכ    |
    | דש)כדשכדכ    | דכדש-דככד    |

  @form
  Scenario Outline: first name, last name invalid values test (BUG)
    Given I navigate to "BusinessLicenseExists" page
    When I write "<first_name>" in "שם פרטי"
    And I write "<last_name>" in "שם משפחה"
    Then Check field "שם פרטי" has valid valid
    And Check field "שם משפחה" has valid valid
    And Validate that "שם פרטי" have the input only Hebrew with the allowed signs
    And Validate that "שם משפחה" have the input only Hebrew with the allowed signs
    Examples:
    | first_name      | last_name        |
    | سفغعه           | يبلاتنم            |
    | 345يبلات#$%      | يبلات567$%^        |
    | ؤرلاع%^&dfghj    | fghj567          |
    | dfghj$%^&*      | DFGHJrtyj$%^6    |
    | ertyuh$%^       | $%^&FGHcvbn      |
    | כעיחRTYU4%^&%^  | $%^&RTYقفغfghعه   |

  @form
  Scenario: first name, last name empty field error message (valid)
    Given I navigate to "BusinessLicenseExists" page
    When I write " " in "שם פרטי"
    When I write " " in "שם משפחה"
    Then Check field "שם פרטי" has invalid value
    Then Check field "שם משפחה" has invalid value
    And Check if error message of "שם פרטי" is "יש למלא שם פרטי"
    And Check if error message of "שם משפחה" is "יש למלא שם משפחה"

  @form
  Scenario Outline: first name, last name  wrong input error message (BUG)
    Given I navigate to "BusinessLicenseExists" page
    When I write "<first_name>" in "שם פרטי"
    And I write "<last_name>" in "שם משפחה"
    Then Check field "שם פרטי" has invalid value
    And Check field "שם משפחה" has invalid value
    And Check if error message of "שם פרטי" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    And Check if error message of "שם משפחה" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | first_name            | last_name            |
    |   firas               |  firas               |
    |   asdas               |   asdas              |
    |   fiwrqrwwras         |  fiwrqrwwras         |
    |   firdasd3r3ras       |  firdasd3r3ras       |


  @form
  Scenario Outline: house number valid values test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<house_number>" in "מספר בית"
    And I write "<postal_number>" in "מיקוד"
    Then Check field "מספר בית" has valid value
    And Check field "מיקוד" has valid value
    And Validate that "מספר בית" have the input with only numbers
    And Validate that"מיקוד" have the input with only numbers
    Examples:
    |house_number  | postal_number  |
    | 356534567    |356534567    |
    | 22334ttfd    |22334ttfd    |
    | 112gdds40    |112gdds40    |
    | 22sdfs440    |22sdfs440    |
    | 111#$%&00    |111#$%&00    |
    | 223עיחל57    |223עיחל57     |
    | 223بتتن39    |223بتتن39     |
    | 5$^%56745    |5$^%56745    |
    | 1212@@$20    |1212@@$20    |
    | 0088OIk80    |0088OIk80    |
    | 433opl433    |433opl433    |
    | 75כע23133    |75כע23133    |


   @form
  Scenario Outline: Entrance valid values test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<entrance>" in "כניסה"
    Then Check field "כניסה" has valid valid
    And Validate that "כניסה" have the input with only hebrew and english
    Examples:
    | entrance    |
    | פראס        |
    | שדכשדשדג    |
    | שדגשגדג     |
    | דככשכד      |
    | דשכדשכדכ    |
    | asdasd     |

  @form
  Scenario Outline: Entrance invalid values test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<entrance>" in "כניסה"
    Then Check field "כניסה" has valid valid
    And Validate that "כניסה" have the input with only hebrew and english

    Examples:
    | entrance      |
    | سفغعه           |
    | 345يبلات#$%      |
    | ؤرلاع%^&dfghj    |
    | dfghj$%^&*      |
    | ertyuh$%^       |
    | כעיחRTYU4%^&%^  |
    | גכעיח__כעיחל    |


  @form
  Scenario Outline: Entrance wrong input error message
    Given I navigate to "BusinessLicenseExists" page
    When I write "<entrance>" in "כניסה"
    Then Check field "כניסה" has invalid value
    And Check if error message of "כניסה" is "אותיות בלבד"
    Examples:
    | entrance         |
    |   firas1         |
    |   asdas2313      |
    |   fiwr$%qrwwras  |
    |   firdasd3r3ras  |


  @form
  Scenario Outline: phoneNumber valid values test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<phone_number>" in "טלפון נייד"
    Then Check field "טלפון נייד" has valid value
    And Validate that "טלפון נייד" have the input with only numbers
    Examples:
    | phone_number |
    | 052-7878787   |
    | 056-8907495   |
    | 077-8748576   |
    | 059-7247857   |

  @form
  Scenario Outline: phoneNumber invalid values test (BUG: PhoneNumber suppose allow to write just numbers)
    Given I navigate to "BusinessLicenseExists" page
    When I write "<phone_number>" in "טלפון נייד"
    Then Check field "טלפון נייד" has valid value
    And Validate that "טלפון נייד" have the input with only numbers
     Examples:
    | phone_number |
    | sjh-skjsksj  |
    | sdsasasdd    |
    | gregwe$%f    |
    | @#$%^&*(7    |

  @form
  Scenario: phoneNumber empty field error message test
    Given I navigate to "BusinessLicenseExists" page
    When I write " " in "טלפון נייד"
    Then Check field "טלפון נייד" has invalid value
    And Check if error message of "טלפון נייד" is "יש להזין מספר טלפון נייד"

  @form
  Scenario Outline: phoneNumber wrong input error message test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<phone_number>" in "טלפון נייד"
    Then Check field "טלפון נייד" has invalid value
    And Check if error message of "טלפון נייד" is "יש להזין ספרות בלבד"
    Examples:
    | phone_number |
    | dkadsasdas   |
    | 052sdks2j2   |
    | 054394832j   |
    | 035יעחלךןח   |
    | 077تلاتتاتن   |

  @form
  Scenario Outline: phoneNumber incomplete input error message test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<phone_number>" in "טלפון נייד"
    Then Check field "טלפון נייד" has invalid value
    And Check if error message of "טלפון נייד" is "ש להשלים את הספרות החסרות"
    Examples:
    | phone_number  |
    | 05-22          |
    | 05-234         |
    | 05-4567        |


  @form
  Scenario Outline: email valid values test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<email>" in "דוא"ל"
    Then Check field "דוא"ל" has valid value
    And Validate that "דוא"ל" have the input only english, numbers with the allowed signs
    Examples:
    | email  |
    | sda32sd@dyj.com    |
    | rtyu@sd.com        |
    | qw@hj.com          |
    | qw@hj.asd.com      |
    | qwd@d.com          |
    | assd@b.sas.com     |
    | asasd@grgb.com     |
    | aqaws@bfew.com     |
    | fewfas@fefsab.com  |
    | awdas@efadsb.com   |

  @form
  Scenario Outline: email invalid values test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<email>" in "דוא"ל"
    Then Check field "דוא"ל" has invalid value
    And Validate that "דוא"ל" have the input only english, numbers with the allowed signs
    Examples:
    | email  |
    | a@b...דג..............com    |
    | a@b.com.سيسي                 |
    | a@b.com.12سيsd#%             |
    | aس@b.com                     |
    | A$h@B.com                    |
    | A@f@h$.com                   |
    | a.b@c.d@d.com                |
    | dgh.@gjj.com                 |
    | dfghj.dfghj@@j.com           |

  @form
  Scenario Outline: email invalid values test (BUG: in format of email writing)
    Given I navigate to "BusinessLicenseExists" page
    When I write "<email>" in "דוא"ל"
    Then Check field "דוא"ל" has invalid value
    And Validate that "דוא"ל" have the input only english, numbers with the allowed signs
    Examples:
    | email  |
    | a@b.com.com.com.com     |
    | a@b.com.com.comcccc.com |
    | A@B.COM                 |
    | a%@b.com                |
    | a_----___---_____r@b.com|
    | a+r@b.com               |
    |A@b.cOm                  |

  @form
  Scenario Outline: email invalid values error message test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<email>" in "דוא"ל"
    Then Check field "דוא"ל" has invalid value
    And Check if error message of "דוא"ל" is "דוא''ל לא תקין"
    Examples:
    | email  |
    | a@b...דג..............com    |
    | a@b.com.سيسي                 |
    | a@b.com.12سيsd#%             |
    | aس@b.com                     |
    | A$h@B.com                    |
    | A@f@h$.com                   |


  @form
  Scenario Outline: Address valid value test
    Given I navigate to "BusinessLicenseExists" page
    When I pick "<address>" in "ישוב"
    Examples:
    | address        |
    | אבו גוש         |
    | אבו סנאן        |
    | אבו עמאר )שבט(  |
    | ירושלים         |


  @form
  Scenario Outline: Street valid value test
    Given I navigate to "BusinessLicenseExists" page
    When I pick "<street>" in "רחוב"
    Examples:
    | street      |
    | א - זבאדי   |
    | א - זרה     |
    | א זהרה      |


  @form
  Scenario Outline: add file valid values test
    Given I navigate to "BusinessLicenseExists" page
    When Click On "הוספת קובץ" sign in "ת.ז. בעל העסק"
    Then Check if the "<the_first_file>" name is allowed
    And Check if the "<the_first_file>" type is allowed
    And Check if the "<the_first_file>" size is allowed
    And Pick the file
    Examples:
    | the_first_file     |
    | website.docx       |
    | טפסים לאוטומציה.xlsx|
    | Form.PDF           |


  @form
  Scenario Outline: add file invalid values error message test
    Given I navigate to "BusinessLicenseExists" page
    When Click On "הוספת קובץ" sign in "ת.ז. בעל העסק"
    Then Check if the "<the_first_file>" name is allowed
    And Check if the "<the_first_file>" type is allowed
    And Check if the "<the_first_file>" size is allowed
    And Pick the file
    And Check if error message of "ת.ז. בעל העסק" is "סוג קובץ אינו חוקימותרים קבצים מסוג זה בלבד: .bmp, .gif, .png, .jpg, .jpeg, .doc, .docx, .pdf, .xlsx, .xls"
    Examples:
    | the_first_file                |
    | municipality_of_jerusalem.zip |












