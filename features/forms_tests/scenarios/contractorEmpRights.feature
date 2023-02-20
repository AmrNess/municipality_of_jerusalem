Feature: header, fields test of ContractorEmpRights Form Page

  """
  - Feature file name: contractorEmpRights.feature
  - Form link: https://jeronlineforms.jerusalem.muni.il/ContractorEmpRights
  - Number of Pages is : 2, We are at Page: 1
  - mandatory fields are: מספר זהות, שם פרטי, שם משפחה,
   מספר טלפון נייד, אימייל, ענף, שם חברה, תאריך תחילת העבודה בחברה, נושא התלונה, פרטי התלונה, חודשים לבדיקה,
   האם היתה פניה למעסיק קודם הגשת תלונה זו
  """

  @header
  Scenario: Check explanation of form
    Given I navigate to "ContractorEmpRights" page
    Then Is application information tittle is "הסבר למילוי הטופס:"
    And Check if application explanation have text

  @header
  Scenario: Check Print display
    Given I navigate to "ContractorEmpRights" page
    When I click on "הדפס" button
    And Check if Print display is clear

  @form
  Scenario : full scenario for the page test
    Given I navigate to "PlaceContainer" page
    When I write "332796184" in "מספר זהות"
    And I write "פראס" in "שם פרטי"
    And I write "אבו סנינה" in "שם משפחה"
    And I pick date of "14/02/2023" in "תאריך לידה"
    And I pick "א - זבאדי" in "רחוב"
    And I write "2" in "מספר בית"
    And I write "1" in "מספר דירה"
    And I write "028076374" in "מספר טלפון"
    And I write "0528076374" in "מספר טלפון נייד"
    And I write "firas@ab.com" in "אימייל"
    And I pick "הסעדה" in "ענף"
    And I pick "גורמה ארוחות בע"מ " in "שם חברה"
    And I write "אבו דגשדגשדככ" in "שם אתר עירוני"
    And I pick date of "12/4/1990 " in "תאריך תחילת העבודה בחברה"
    And I pick "ניהול פנקס שעות עבודה " in "נושא התלונה"
    And I write "פראס" in "פרטי התלונה"
    And Click On "+" sign in "חודשים לבדיקה"
    And I pick "2023" in "שנה"
    And I pick "1" in "חודשים"
    And Choose "כן" in "האם היתה פניה למעסיק קודם הגשת תלונה זו"
    And I write "שדכשד__שדג " in "התשובה שקיבלתי"
    And I click on "שמור" button
    Then validate that field "מספר זהות" has "332796184"
    And validate that field "שם פרטי" has "פראס"
    And validate that field "שם משפחה" has "אבו סנינה"
    And validate that field "תאריך לידה" has "14/02/2023"
    And validate that field "רחוב" has "א - זבאדי"
    And validate that field "מספר בית" has "2"
    And validate that field "מספר דירה" has "1"
    And validate that field "מספר טלפון" has "028076374"
    And validate that field "מספר טלפון נייד" has "0528076374"
    And validate that field "אימייל" has "firas@ab.com"
    And validate that field "ענף" has "הסעדה"
    And validate that field "שם חברה" has "גורמה ארוחות בע"מ "
    And validate that field "שם אתר עירוני" has "אבו דגשדגשדככ"
    And validate that field "תאריך תחילת העבודה בחברה" has "12/4/1990 "
    And validate that field "נושא התלונה" has "ניהול פנקס שעות עבודה "
    And validate that field "פרטי התלונה" has "פראס"
    And validate that field "חודשים" has "1"
    And validate that field "שנה" has "2023"
    And validate that field "האם היתה פניה למעסיק קודם הגשת תלונה זו" has "כן"
    And validate that field "התשובה שקיבלתי" has "שדכשד__שדג "



  @form
  Scenario : Check if the mandatory are invalid
    Given I navigate to "CollectiveLifeInsurance" page
    When I click on "שמור" button
    Then Validate that we are in step "פרטי העובד/ת, המעסיק והתלונה" of the page
    And Check if "מספר זהות" has "יש להזין מספר זהות" error message
    And Check if "שם פרטי" has "יש למלא שם פרטי" error message
    And Check if "שם משפחה" has "יש למלא שם משפחה" error message
    And Check if "מספר טלפון נייד" has "חובה להזין מספר טלפון נייד" error message
    And Check if "אימייל" has "חובה להזין כתובת אימייל" error message
    And Check if "ענף" has "יש לבחור ענף" error message
    And Check if "שם חברה" has "יש לבחור שם חברה" error message
    And Check if "תאריך תחילת העבודה בחברה" has "יש לסמן תאריך תחילת עבודה" error message
    And Check if "נושא התלונה" has "יש לבחור את נושא/י התלונה" error message
    And Check if "פרטי התלונה" has "יש למלא את פרטי התלונה" error message
    And Check if "חודשים לבדיקה" has "נא למלא שנה נא למלא חודש/ים" error message
    And Check if "האם היתה פניה למעסיק קודם הגשת תלונה זו" has "יש לסמן האם היתה פניה למעסיק קודם הגשת תלונה זו" error message

  @form
  Scenario Outline: id valid value test
    Given I navigate to "ContractorEmpRights" page
    When I write "<id>" in "מספר זהות"
    Then Check field "מספר זהות" has valid value
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
  Scenario Outline: id invalid value test
    Given I navigate to "ContractorEmpRights" page
    When I write "<id>" in "מספר זהות"
    Then Check field "מספר זהות" has invalid value
    And Check if error message of "מספר זהות" is "מספר זהות לא תקין"
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
  Scenario Outline: id invalid value test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<id>" in "מספר זהות"
    Then Check field "מספר זהות" has invalid value
    Examples:
    | id                            |
    | 000000000                     |
    | 000000018                     |
    | 3327981827336443728282        |
    | 12321323142133                |
    | 12345678934567467788998       |
    | 33279618433                   |
    | 22345567754                   |
    | 2323443211343355              |
    | 33344557897                   |
    | 00                            |
    | 33279618433                   |
    | 22345567754                   |
    | 331133232ssd2321312233        |


  @form
  Scenario Outline: house number, apartment_number valid value test
    Given I navigate to "ContractorEmpRights" page
    When I write "<house_number>" in "מספר בית"
    And I write "<apartment_number>" in "מספר דירה"
    Then Check field "מספר בית" has valid value
    And Check field "מספר דירה" has valid value
    And Validate that "מספר בית" have the input with only numbers
    And Validate that "מספר דירה" have the input with only numbers
    Examples:
    |house_number  | apartment_number |
    | 356534567    | 356534567        |
    | 22334ttfd    | 22334ttfd        |
    | 112gdds40    | 112gdds40        |
    | 22sdfs440    | 22sdfs440        |
    | 111#$%&00    | 111#$%&00        |
    | 223עיחל57    | 223עיחל57         |
    | 223بتتن39    | 223بتتن39         |
    | 5$^%56745    | 5$^%56745        |
    | 1212@@$20    | 1212@@$20        |
    | 0088OIk80    | 0088OIk80        |
    | 433opl433    | 433opl433        |
    | 75כע23133    | 75כע23133        |
    | ראטוןןלםם    | ראטוןןלםם         |
    | المينسةؤن    | المينسةؤن         |
    | dlkjhokjl   | dlkjhokjl         |

  @form
  Scenario Outline: house number, apartment_number invalid value test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<house_number>" in "מספר בית"
    And I write "<apartment_number>" in "מספר דירה"
    Then Check field "מספר בית" has valid value
    And Check field "מספר דירה" has valid value
    And Validate that "מספר בית" have the input with only numbers
    And Validate that "מספר דירה" have the input with only numbers
    Examples:
    |house_number  | apartment_number|
    | 457756e67    | 457756e67       |
    | e56765786    | e56765786       |
    | 56877e456    | 56877e456       |
    | 45658987e    | 45658987e       |
    | 5e6787679    | 5e6787679       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |
    | 5e6787679    | 45658987e       |

  @form
  # excel sheet rule number 4
  Scenario Outline: first name, last name, street, city name valid value test
    Given I navigate to "ContractorEmpRights" page
    When I write "<first_name>" in "שם פרטי"
    And I write "<last_name>" in "שם משפחה"
    And I write "<street>" in "רחוב"
    And I write "<city_site_name>" in "שם אתר עירוני"
    Then Check field "שם פרטי" has valid valid
    And Check field "שם משפחה" has valid valid
    And Check field "רחוב" has valid valid
    And Check field "שם אתר עירוני" has valid valid
    And Validate that "שם פרטי" have the input only Hebrew with the allowed signs
    And Validate that "שם משפחה" have the input only Hebrew with the allowed signs
    And Validate that "רחוב" have the input only Hebrew with the allowed signs
    And Validate that "שם אתר עירוני" have the input only Hebrew with the allowed signs
    Examples:
    | first_name  | last_name    | street       | city_site_name  |
    | פראס         | א-בו דגככ    |  אבו דגככ     | אבו דגשדגשדככ    |
    | שדכשד__שדג   | שדגשד)(גשדג   |  אבו ד_גככ   | אבו דכעי_גככ     |
    | שדג_שגדג     | שדגשדג       |  אבו דגככ     | אבעכגקו דגככ     |
    | דכ.כשכד      | דשכשד)כדכ    |  אבו דג_ככ    | אבו דגק'כ'קככ    |
    | דש)כדשכדכ    | דכדש-דככד    |  אבו דגככ     | כקכאבו דגככ      |

  @form
  Scenario Outline: first name, last name, street, city name invalid value test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<first_name>" in "שם פרטי"
    And I write "<last_name>" in "שם משפחה"
    And I write "<street>" in "רחוב"
    And I write "<city_site_name>" in "שם אתר עירוני"
    Then Check field "שם פרטי" has valid valid
    And Check field "שם משפחה" has valid valid
    And Check field "רחוב" has valid valid
    And Check field "שם אתר עירוני" has valid valid
    And Validate that "שם פרטי" have the input only Hebrew with the allowed signs
    And Validate that "שם משפחה" have the input only Hebrew with the allowed signs
    And Validate that "רחוב" have the input only Hebrew with the allowed signs
    And Validate that "שם אתר עירוני" have the input only Hebrew with the allowed signs
    Examples:
    | first_name      | last_name        |  street           | city_site_name   |
    | سفغعه           | يبلاتنم            |  يبلاتنم            | يبلات567$%^       |
    | 345يبلات#$%      | يبلات567$%^        |  يبلات567$%^       | DFGHJrtyj$%^     |
    | ؤرلاع%^&dfghj    | fghj567          |  fghj567          | fghj567%^        |
    | dfghj$%^&*      | DFGHJrtyj$%^6    |  DFGHJrtyj$%^6    | يبلات567$%^       |
    | ertyuh$%^       | $%^&FGHcvbn      |  $%^&FGHcvbn      | ertyuh$%^        |
    | כעיחRTYU4%^&%^  | $%^&RTYقفغfghعه   |  $%^&RTYقفغfghعه  |כעיחRTYU4%^        |

  @form
  Scenario: first name empty field error message test
    Given I navigate to "ContractorEmpRights" page
    When I write " " in "שם פרטי"
    Then Check field "שם פרטי" has invalid value
    And Check if error message of "שם פרטי" is "יש למלא שם פרטי"

  @form
  Scenario Outline: first name wrong input error message test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<first_name>" in "שם פרטי"
    Then Check field "שם פרטי" has invalid value
    And Check if error message of "שם פרטי" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | first_name            |
    |   firas               |
    |   asdas               |
    |   fiwrqrwwras         |
    |   firdasd3r3ras       |

  @form
  Scenario: last name empty field error message test
    Given I navigate to "ContractorEmpRights" page
    When I write " " in "שם משפחה"
    Then Check field "שם משפחה" has invalid value
    And Check if error message of "שם משפחה" is "יש למלא שם משפחה"

  @form
  Scenario Outline: last name wrong input error message test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<last_name>" in "שם משפחה"
    Then Check field "שם משפחה" has invalid value
    And Check if error message of "שם משפחה" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | last_name             |
    |   firas               |
    |   asdas               |
    |   fiwrqrwwras         |
    |   firdasd3r3ras       |

  @form
  Scenario Outline: street wrong input error message test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<street>" in "רחוב"
    Then Check field "רחוב" has invalid value
    And Check if error message of "רחוב" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | street                |
    |   sfsafsafasd         |
    |   גכעיחלךכעיחל         |
    |   بلاتنم%^&*[لأأـ،قفإ‘÷  |

  @form
  Scenario Outline: city site name wrong input error message test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<city_site_name>" in "שם אתר עירוני"
    Then Check field "שם אתר עירוני" has invalid value
    And Check if error message of "שם אתר עירוני" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | city_site_name        |
    |   sfsafsafasd         |
    |   גכעיחלךכעיחל         |
    |   بلاتنم%^&*[لأأـ،قفإ‘÷  |

  @form
  Scenario Outline: email valid value test
    Given I navigate to "ContractorEmpRights" page
    When I write "<email>" in "אימייל"
    Then Check field "אימייל" has valid value
    And Validate that "אימייל" have the input only english, numbers with the allowed signs
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
  Scenario Outline: email invalid value test
    Given I navigate to "ContractorEmpRights" page
    When I write "<email>" in "אימייל"
    Then Check field "אימייל" has invalid value
    And Validate that "אימייל" have the input only english, numbers with the allowed signs
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
  Scenario Outline: email invalid value test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<email>" in "אימייל"
    Then Check field "אימייל" has invalid value
    And Validate that "אימייל" have the input only english, numbers with the allowed signs
    Examples:
    | email  |
    |a@b.com.com.com.com     |
    |a@b.com.com.comcccc.com |
    |A@B.COM                 |
    |a%@b.com                |
    |a_----___---_____r@b.com|
    |a+r@b.com               |
    |A@b.cOm                 |
    |a@b.com.com.com.com     |


  @form
  Scenario Outline: email wrong input error message test
    Given I navigate to "ContractorEmpRights" page
    When I write "<email>" in "אימייל"
    Then Check field "אימייל" has invalid value
    And Check if error message of "אימייל" is "דוא''ל לא תקין"
    Examples:
    | email  |
    | a@b...דג..............com    |
    | a@b.com.سيسي                 |
    | a@b.com.12سيsd#%             |
    | aس@b.com                     |
    | A$h@B.com                    |
    | A@f@h$.com                   |



  @form
  Scenario Outline: phoneNumber valid value test
    Given I navigate to "ContractorEmpRights" page
    When I write "<phone_number>" in "מספר טלפון נייד"
    Then Check field "מספר טלפון נייד" has valid value
    And Validate that "מספר טלפון נייד" have the input with only numbers
    Examples:
    | phone_number |
    | 0527878787   |
    | 0568907495   |
    | 0778748576   |
    | 0597247857   |

  @form
  Scenario Outline: phoneNumber invalid value test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<phone_number>" in "מספר טלפון נייד"
    Then Check field "מספר טלפון נייד" has valid value
    And Validate that "מספר טלפון נייד" have the input with only numbers
     Examples:
    | phone_number |
    | sjh-skjsksj  |
    | sdsasasdd    |
    | gregwe$%f    |
    | @#$%^&*(7    |

  @form
  Scenario: phoneNumber empty field error message test
    Given I navigate to "ContractorEmpRights" page
    When I write " " in "מספר טלפון נייד"
    Then Check field "מספר טלפון נייד" has invalid value
    And Check if error message of "מספר טלפון נייד" is "יש להזין מספר טלפון נייד"

  @form
  Scenario Outline: phoneNumber wrong input error message test
    Given I navigate to "ContractorEmpRights" page
    When I write "<phone_number>" in "מספר טלפון נייד"
    Then Check field "מספר טלפון נייד" has invalid value
    And Check if error message of "מספר טלפון נייד" is "יש להזין ספרות בלבד"
    Examples:
    | phone_number |
    | dkadsasdas   |
    | 052sdks2j2   |
    | 054394832j   |
    | 035יעחלךןח   |
    | 077تلاتتاتن   |

  @form
  Scenario Outline: phoneNumber wrong input error message test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<phone_number>" in "מספר טלפון נייד"
    Then Check field "מספר טלפון נייד" has invalid value
    And Check if error message of "מספר טלפון נייד" is "ש להשלים את הספרות החסרות"
    Examples:
    | phone_number  |
    | 0522          |
    | 05234         |
    | 054567        |

  @form
  Scenario Outline: HomePhoneNumber valid values test
    Given I navigate to "ContractorEmpRights" page
    When I write "<home_phone_number>" in "מספר טלפון"
    Then Check field "מספר טלפון" has valid value
    And Validate that "מספר טלפון" have the input with only numbers
    Examples:
    | home_phone_number  |
    | 027878787          |
    | 068907495          |
    | 078748576          |
    | 053247857          |

  @form
  Scenario Outline: HomePhoneNumber invalid values test
    Given I navigate to "ContractorEmpRights" page
    When I write "<home_phone_number>" in "מספר טלפון"
    Then Check field "מספר טלפון" has invalid value
    And Validate that "מספר טלפון" have the input with only numbers
     Examples:
    | home_phone_number |
    | sjh-skjsksj       |
    | sdsasasdd         |
    | gregwe$%f         |
    | @#$%^&*(7         |
    | dka-dsasdas        |
    | 052-sdks2j2        |
    | 054-394832j        |
    | 035-יעחלךןח        |
    | 077-تلاتتاتن        |

  @form
  Scenario Outline: HomePhoneNumber invalid values test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<home_phone_number>" in "מספר טלפון"
    Then Check field "מספר טלפון" has invalid value
    And Check if error message of "מספר טלפון" is "ש להשלים את הספרות החסרות"
    Examples:
    | home_phone_number  |
    | 0522               |
    | 05234              |
    | 054567             |

  @form
  Scenario Outline: birthday date valid value test
    Given I navigate to "ContractorEmpRights" page
    When I pick date of "<birthday_date>" in "תאריך לידה"
    Examples:
    | birthday_date |
    | 12/4/1990     |
    | 15/3/1997     |
    | 23/6/2000     |
    | 4/7/2020      |
    | 3/12/2017     |
    | 2/1/2018      |

  @form
  Scenario Outline: branch valid value test
    Given I navigate to "PlaceContainer" page
    When I pick "<branch>" in "ענף"
    Examples:
    | branch  |
    | הסעדה   |
    | שמירה   |
    | ניקיון  |

  @form
  Scenario Outline: company name valid value test
    Given I navigate to "PlaceContainer" page
    When I pick "<company_name>" in "שם חברה"
    Examples:
    | company_name          |
    | גורמה ארוחות בע"מ      |
    | נפלאות התזונה בע"מ     |
    | ברקל תעשיות מזון בע"מ  |
    | מצודת אגסי בע"מ        |
    | קמח תורה בע"מ          |
    | גורמה ארוחות בע"מ      |

  @form
  Scenario Outline: date of starting work in the company valid value test
    Given I navigate to "ContractorEmpRights" page
    When I pick date of "<date_of_starting_work>" in "תאריך תחילת העבודה בחברה"
    Examples:
    | date_of_starting_work  |
    | 12/4/1990              |
    | 15/3/1997              |
    | 23/6/2000              |
    | 4/7/2020               |
    | 3/12/2017              |
    | 2/1/2018               |

  @form
  Scenario Outline: company name valid value test
    Given I navigate to "PlaceContainer" page
    When I pick "<complaint_subject>" in "נושא התלונה"
    Examples:
    | complaint_subject                                          |
    | ניהול פנקס שעות עבודה                                       |
    | תשלומי שכר בגין השתתפות במטווחים, השתלמויות וקורסי ריענון ירי  |
    | מתן הודעה לעובד                                             |
    | דמי נסיעות                                                  |

  @form
  Scenario Outline: complaint details valid value test
    Given I navigate to "ContractorEmpRights" page
    When I write "<complaint_details>" in "פרטי התלונה"
    Then Check field "פרטי התלונה" has valid valid
    And Validate that "פרטי התלונה" have the input only Hebrew with the allowed signs
    Examples:
    | complaint_details  |
    | פראס               |
    | שדכשד__שדג          |
    | שדג_שגדג            |
    | דכ.כשכד             |
    | דש)כדשכדכ           |

  @form
  Scenario Outline: complaint details invalid value test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<complaint_details>" in "פרטי התלונה"
    Then Check field "פרטי התלונה" has valid valid
    And Validate that "פרטי התלונה" have the input only Hebrew with the allowed signs
    Examples:
    | complaint_details       |
    | سفغعه                   |
    | 345يبلات#$%              |
    | ؤرلاع%^&dfghj            |
    | dfghj$%^&*              |
    | ertyuh$%^               |
    | כעיחRTYU4%^&%^          |

  @form
  Scenario: complaint details empty field error message
    Given I navigate to "ContractorEmpRights" page
    When I write " " in "פרטי התלונה"
    Then Check field "פרטי התלונה" has invalid value
    And Check if error message of "פרטי התלונה" is "יש למלא את פרטי התלונה"

  @form
  Scenario Outline: complaint details wrong input error message (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<complaint_details>" in "פרטי התלונה"
    Then Check field "פרטי התלונה" has invalid value
    And Check if error message of "פרטי התלונה" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | complaint_details      |
    |   firas                |
    |   asdas                |
    |   fiwrqrwwras          |
    |   firdasd3r3ras        |
    |   بلاتنمؤبلاتنمكلات        |

  @form
  Scenario: question value valid value test
    Given I navigate to "ContractorEmpRights" page
    When Choose "כן" in "האם היתה פניה למעסיק קודם הגשת תלונה זו"

  @form
  Scenario Outline: answer_you_got valid value test
    Given I navigate to "ContractorEmpRights" page
    When I write "<answer_you_got>" in "התשובה שקיבלתי"
    Then Check field "התשובה שקיבלתי" has valid valid
    And Validate that "התשובה שקיבלתי" have the input only Hebrew with the allowed signs
    Examples:
    | answer_you_got   |
    | פראס             |
    | שדכשד__שדג       |
    | שדג_שגדג         |
    | דכ.כשכד          |
    | דש)כדשכדכ        |

  @form
  Scenario Outline: answer_you_got invalid value test (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<answer_you_got>" in "התשובה שקיבלתי"
    Then Check field "התשובה שקיבלתי" has valid valid
    And Validate that "התשובה שקיבלתי" have the input only Hebrew with the allowed signs
    Examples:
    | answer_you_got   |
    | سفغعه            |
    | 345يبلات#$%       |
    | ؤرلاع%^&dfghj     |
    | dfghj$%^&*       |
    | ertyuh$%^        |
    | כעיחRTYU4%^&%^   |
    |   firas             |
    |   asdas             |
    |   fiwrqrwwras       |
    |   firdasd3r3ras     |
    |   بلاتنمؤبلاتنمكلات     |

  @form
  Scenario Outline: answer_you_got wrong input error message (BUG)
    Given I navigate to "ContractorEmpRights" page
    When I write "<answer_you_got>" in "התשובה שקיבלתי"
    Then Check field "התשובה שקיבלתי" has invalid value
    And Check if error message of "התשובה שקיבלתי" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | answer_you_got      |
    |   firas             |
    |   asdas             |
    |   fiwrqrwwras       |
    |   firdasd3r3ras     |
    |   بلاتنمؤبلاتنمكلات     |

  @form
  Scenario Outline: months to check valid value test
    Given I navigate to "ContractorEmpRights" page
    When Click On "+" sign in "חודשים לבדיקה"
    And I pick "<year>" in "שנה"
    And I pick "<month>" in "חודשים"
    Examples:
    | month  | year |
    |  1    |  2023 |
    |  2    |  2022 |
    |  3    |  2023 |
    |  4    |  2021 |
    |  5    |  2020 |
    |  6    |  2019 |
    |  7    |  2018 |
    |  8    |  2022 |
    |  9    |  2021 |
    |  10   |  2020 |
    |  11   |  2019 |
    |  12   |  2018 |
    When Click On "+" sign in "חודשים לבדיקה"
    When Click On "x" sign in "חודשים לבדיקה"