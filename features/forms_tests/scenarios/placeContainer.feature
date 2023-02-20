Feature: header, fields test of PlaceContainer Form Page

  """
    - Feature file name: placeContainer.feature
    - Form link: https://jeronlineforms.jerusalem.muni.il/PlaceContainer
    - Number of Pages is : 2, We are at Page: 1
    - mandatory fields are: סוג זהות, מספר מזהה, שם פרטי, שם משפחה, מספר טלפון נייד, אימייל,
    רחוב, מספר בית, מספר דירה, רחוב הצבת המכולה, מספר מכולה, מתאריך, עד תאריך, סוג החניה, כתובת האתר לשפיכת הפסולת
  """

  @header
  Scenario: Check explanation of form
    Given I navigate to "PlaceContainer" page
    Then Is application information tittle is "הסבר למילוי הטופס:"
    And Check if application explanation have text

  @header
  Scenario: Check Print display
    Given I navigate to "PlaceContainer" page
    When I click on "הדפס" button
    And Check if Print display is clear

  @form
  # we need a recognized ת.ז.\.ח.פ number to be able to check
  Scenario: id value test (valid)
    Given I navigate to "PlaceContainer" page
    When Choose "ת.ז." in "סוג זהות"
    And I write " " in "מספר מזהה"
    Then Check field "מספר מזהה" has valid value
    And Click on "המשך"

  @form
  Scenario : Check if the mandatory are invalid
    Given I navigate to "CollectiveLifeInsurance" page
    When I click on "המשך" button
    Then Validate that we are in step "פרטי הבקשה" of the page
    And Check if "סוג זהות" has "חובה לבחור סוג זהות" error message
    And Check if "מספר מזהה" has "יש למלא מספר מזהה" error message
    And Check if "שם פרטי" has "יש למלא שם פרטי" error message
    And Check if "שם משפחה" has "יש למלא שם משפחה" error message
    And Check if "מספר טלפון נייד" has "חובה להזין מספר טלפון נייד" error message
    And Check if "אימייל" has "חובה להזין כתובת אימייל" error message
    And Check if "רחוב" has "חובה לבחור רחוב" error message
    And Check if "מספר בית" of "כתובת מקום העבודה" has "חובה להזין מספר בית" error message
    And Check if "מספר דירה" has "חובה להזין מספר דירה" error message
    And Check if "רחוב הצבת המכולה" has "חובה להזין כתובת" error message
    And Check if "מספר מכולה" has "חובה להזין מספר מכולה" error message
    And Check if "מתאריך" has "חובה לבחור תאריך" error message
    And Check if "עד תאריך" has "חובה לבחור תאריך" error message
    And Check if "סוג החניה" has "חובה לבחור את סוג החניה" error message
    And Check if "כתובת האתר לשפיכת הפסולת" has "חובה להזין כתובת" error message

  @form
  Scenario : full scenario for the page test (valid)
     Given I navigate to "PlaceContainer" page
     When Choose "ת.ז." in "סוג זהות"
     And I write "332796184" in "מספר מזהה"
     And I write "פראס" in "שם פרטי"
     And I write "אבו סנינה" in "שם משפחה"
     And I write "0528076374" in "מספר טלפון נייד"
     And I write "firas@ab.com" in "אימייל"
     And I pick "א - זבאדי" in "רחוב"
     And I write "2" in "מספר בית" of "כתובת מקום העבודה"
     And I write "1" in "מספר דירה"
     And I pick "א - זבאדי" in "רחוב הצבת המכולה"
     And I write "4" in "מספר בית" of "פרטי הצבת המכולה"
     And I write "2" in "מספר מכולה"
     And I pick date of "12/4/2023 16:00 " in "מתאריך"
     And I pick date of "12/5/2023 16:00 " in "עד תאריך"
     And I pick "מותרת" in "סוג החניה"
     And I write "www.ss.com" in "כתובת האתר לשפיכת הפסולת"
     And I click on "שמור" button
     Then validate that field "מספר מזהה" has "332796184"
     And validate that field "שם פרטי" has "פראס"
     And validate that field "שם משפחה" has "אבו סנינה"
     And validate that field "מספר טלפון נייד" has "0528076374"
     And validate that field "אימייל" has "firas@ab.com"
     And validate that field "רחוב" has "א - זבאדי"
     And validate that field "מספר בית" of "כתובת מקום העבודה" has "2" of
     And validate that field "מספר דירה" has "1"
     And validate that field "רחוב הצבת המכולה" has "א - זבאדי"
     And validate that field "מספר בית"  of "פרטי הצבת המכולה" has "4"
     And validate that field "מספר מכולה" has "1"
     And validate that field "מתאריך" has "12/4/2023 16:00 "
     And validate that field "עד תאריך" has "12/5/2023 16:00 "

  @form
  Scenario Outline: id invalid value error message test
    Given I navigate to "PlaceContainer" page
    When Choose "ת.ז." in "סוג זהות"
    And I write "<id>" in "מספר מזהה"
    Then Check field "מספר מזהה" has invalid value
    And Check if error message of "מספר מזהה" is "עוסק זה אינו מוכר במערכת רישוי עסקים"
    Examples:
    | id                            |
    | 000000001                     |
    | 000000118                     |
    | 000000009                     |
    | 3121                          |
    | 34379818234336234724282       |
    | 92443232                      |
    | salem12321342133              |
    | salem12343457893r44677458     |
    | 83427961833                   |
    | 3219                          |
    | 8883                          |
    | 0157                          |
    | 0180                          |
    | 22345556754                   |
    | 23e23444322343355             |
    | 33sham344557895               |
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
    Given I navigate to "PlaceContainer" page
    When Choose "ת.ז." in "סוג זהות"
    And I write "<id>" in "מספר מזהה"
    Then Check field "מספר מזהה" has invalid value
    And Check if error message of "מספר מזהה" is "עוסק זה אינו מוכר במערכת רישוי עסקים"
    Examples:
    | id  |
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
    | 3327981827336443728282        |
    | 331133232ssd2321312233        |
    # this inputs give us different error msg "יש למלא מספר מזהה"
    | salem12321342133              |
    | 356e34567                     |





  @form
  Scenario Outline: house number, apartment_number, container_number valid value test
    Given I navigate to "PlaceContainer" page
    When I write "<house_number>" in "מספר בית" of "כתובת מקום העבודה"
    And I write "<apartment_number>" in "מספר דירה"
    And I write "<container_number>" in "מספר מכולה"
    And I write "<house_number>" in "מספר בית" of "פרטי הצבת המכולה"
    Then Check field "מספר בית" of "כתובת מקום העבודה" has valid value
    And Check field "מספר דירה" has valid value
    And Check field "מספר מכולה" has valid value
    And Check field "מספר בית" of "פרטי הצבת המכולה" has valid value
    And Validate that "מספר בית" of "כתובת מקום העבודה" have the input with only numbers
    And Validate that "מספר דירה" have the input with only numbers
    And Validate that "מספר מכולה" have the input with only numbers
    And Validate that "מספר בית" of "פרטי הצבת המכולה" have the input with only numbers
    Examples:
    |house_number  | apartment_number | container_number |
    | 356534567    | 356534567        | 356534567        |
    | 22334ttfd    | 22334ttfd        |  22334ttfd       |
    | 112gdds40    | 112gdds40        | 112gdds40        |
    | 22sdfs440    | 22sdfs440        | 22sdfs440        |
    | 111#$%&00    | 111#$%&00        | 111#$%&00        |
    | 223עיחל57     | 223עיחל57        | 223עיחל57        |
    | 223بتتن39     | 223بتتن39        | 223بتتن39        |
    | 5$^%56745    | 5$^%56745        | 5$^%56745        |
    | 1212@@$20    | 1212@@$20        | 1212@@$20        |
    | 0088OIk80    | 0088OIk80        | 0088OIk80        |
    | 433opl433    | 433opl433        | 433opl433        |
    | 75כע23133    | 75כע23133         | 75כע23133        |
    | ראטוןןלםם    | ראטוןןלםם         | ראטוןןלםם         |
    | المينسةؤن    | المينسةؤن         | المينسةؤن         |
    | dlkjhokjl    | dlkjhokjl        | dlkjhokjl        |

  @form
  Scenario Outline: house number, apartment_number, container_number invalid value (BUG: Allows to write letter e)
    Given I navigate to "PlaceContainer" page
    When I write "<house_number>" in "מספר בית" of "כתובת מקום העבודה"
    And I write "<apartment_number>" in "מספר דירה"
    And I write "<container_number>" in "מספר מכולה"
    And I write "<house_number>" in "מספר בית" of "פרטי הצבת המכולה"
    Then Check field "מספר בית" of "כתובת מקום העבודה" has valid value
    And Check field "מספר דירה" has valid value
    And Check field "מספר מכולה" has valid value
    And Check field "מספר בית" of "פרטי הצבת המכולה" has valid value
    And Validate that "מספר בית" of "כתובת מקום העבודה" have the input with only numbers
    And Validate that "מספר דירה" have the input with only numbers
    And Validate that "מספר מכולה" have the input with only numbers
    And Validate that "מספר בית" of "פרטי הצבת המכולה" have the input with only numbers
    Examples:
    |house_number  | apartment_number | container_number |
    | 457756e67    | 457756e67        | 457756e67        |
    | e56765786    | e56765786        | e56765786        |
    | 56877e456    | 56877e456        | 56877e456        |
    | 45658987e    | 45658987e        | 45658987e        |
    | 5e6787679    | 5e6787679        | 5e6787679        |

  @form
  Scenario Outline: first name, last name, web url valid value test
    Given I navigate to "PlaceContainer" page
    When I write "<first_name>" in "שם פרטי"
    And I write "<last_name>" in "שם משפחה"
    And I write "<web_url>" in "כתובת האתר לשפיכת הפסולת"
    Then Check field "שם פרטי" has valid valid
    And Check field "שם משפחה" has valid valid
    And Check field "כתובת האתר לשפיכת הפסולת" has valid valid
    And Validate that "שם פרטי" have the input only Hebrew with the allowed signs
    And Validate that "שם משפחה" have the input only Hebrew with the allowed signs
    And Validate that "כתובת האתר לשפיכת הפסולת" have the input only Hebrew with the allowed signs
    Examples:
    | first_name   | last_name   | web_url     |
    | פראס         | א-בו דגככ    |  אבו דגככ   |
    | שדכשד__שדג   | שדגשד)(גשדג   |  אבו ד_גככ  |
    | שדג_שגדג     | שדגשדג       |  אבו דגככ    |
    | דכ.כשכד      | דשכשד)כדכ    |  אבו דג_ככ   |
    | דש)כדשכדכ    | דכדש-דככד    |  אבו דגככ    |

  @form
  Scenario Outline: first name, last name, web url invalid value test (BUG)
    Given I navigate to "PlaceContainer" page
    When I write "<first_name>" in "שם פרטי"
    And I write "<last_name>" in "שם משפחה"
    And I write "<web_url>" in "כתובת האתר לשפיכת הפסולת"
    Then Check field "שם פרטי" has valid valid
    And Check field "שם משפחה" has valid valid
    And Check field "כתובת האתר לשפיכת הפסולת" has valid valid
    And Validate that "שם פרטי" have the input only Hebrew with the allowed signs
    And Validate that "שם משפחה" have the input only Hebrew with the allowed signs
    And Validate that "כתובת האתר לשפיכת הפסולת" have the input only Hebrew with the allowed signs
    Examples:
    | first_name      | last_name      |  web_url          |
    | سفغعه           | يبلاتنم          |  يبلاتنم           |
    | 345يبلات#$%      | يبلات567$%^      |  يبلات567$%^       |
    | ؤرلاع%^&dfghj    | fghj567         |  fghj567         |
    | dfghj$%^&*     | DFGHJrtyj$%^6    |  DFGHJrtyj$%^6   |
    | ertyuh$%^      | $%^&FGHcvbn      |  $%^&FGHcvbn     |
    | כעיחRTYU4%^&%^ | $%^&RTYقفغfghعه   |  $%^&RTYقفغfghعه |

  @form
  Scenario: first name empty field error message
    Given I navigate to "PlaceContainer" page
    When I write " " in "שם פרטי"
    Then Check field "שם פרטי" has invalid value
    And Check if error message of "שם פרטי" is "יש למלא שם פרטי"

  @form
  Scenario Outline: first name wrong inout error message (BUG)
    Given I navigate to "PlaceContainer" page
    When I write "<first_name>" in "שם פרטי"
    Then Check field "שם פרטי" has invalid value
    And Check if error message of "שם פרטי" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | first_name                  |
    |   firas                     |
    |   firasdads                 |
    |   fwdafכעיחيبلات$%wiras       |
    |   firawتفغ$%^&efwegfs       |

  @form
  Scenario: last name empty field error message
    Given I navigate to "PlaceContainer" page
    When I write " " in "שם משפחה"
    Then Check field "שם משפחה" has invalid value
    And Check if error message of "שם משפחה" is "יש למלא שם משפחה"

  @form
  Scenario Outline:  last name wrong inout error message (BUG)
    Given I navigate to "PlaceContainer" page
    When I write "<last_name>" in "שם משפחה"
    Then Check field "שם משפחה" has invalid value
    And Check if error message of "שם משפחה" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | last_name                   |
    |   firas                     |
    |   firasdads                 |
    |   fwdafכעיחيبلات$%wiras       |
    |   firawتفغ$%^&efwegfs       |

  @form
  Scenario: web url empty field error message
    Given I navigate to "PlaceContainer" page
    When I write " " in "כתובת האתר לשפיכת הפסולת"
    Then Check field "כתובת האתר לשפיכת הפסולת" has invalid value
    And Check if error message of "כתובת האתר לשפיכת הפסולת" is "חובה להזין כתובת"

  @form
  Scenario Outline: web url wrong inout error message (BUG)
    Given I navigate to "PlaceContainer" page
    When I write "<web_url>" in "כתובת האתר לשפיכת הפסולת"
    Then Check field "כתובת האתר לשפיכת הפסולת" has invalid value
    # dont know what the format of the url
    And Check if error message of "כתובת האתר לשפיכת הפסולת" is " "
    Examples:
    | web_url               |
    |   sfsafsafasd         |
    |   גכעיחלךכעיחל         |
    |   بلاتنم%^&*[لأأـ،قفإ‘÷  |

  @form
  Scenario Outline: email valid value test
    Given I navigate to "PlaceContainer" page
    When I write "<email>" in "אימייל"
    Then Check field "אימייל" has valid value
    And Validate that "אימייל" have the input only english, numbers with the allowed signs
    Examples:
    | email              |
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
    Given I navigate to "PlaceContainer" page
    When I write "<email>" in "אימייל"
    Then Check field "אימייל" has invalid value
    And Validate that "אימייל" have the input only english, numbers with the allowed signs
    Examples:
    | email                        |
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
    Given I navigate to "PlaceContainer" page
    When I write "<email>" in "אימייל"
    Then Check field "אימייל" has invalid value
    And Validate that "אימייל" have the input only english, numbers with the allowed signs
    Examples:
    | email                          |
    | a@b.com.com.com.com            |
    | a@b.com.com.comcccc.com        |
    | A@B.COM                        |
    | a%@b.com                       |
    | a_----___---_____r@b.com       |
    | a+r@b.com                      |
    |A@b.cOm                         |

  @form
  Scenario Outline: email wrong input error message test
    Given I navigate to "PlaceContainer" page
    When I write "<email>" in "אימייל"
    Then Check field "אימייל" has invalid value
    And Check if error message of "אימייל" is "דוא''ל לא תקין"
    Examples:
    | email                        |
    | a@b...דג..............com    |
    | a@b.com.سيسي                 |
    | a@b.com.12سيsd#%             |
    | aس@b.com                     |
    | A$h@B.com                    |
    | A@f@h$.com                   |

  @form
  Scenario Outline: email wrong input error message test (BUG)
    Given I navigate to "PlaceContainer" page
    When I write "<email>" in "אימייל"
    Then Check field "אימייל" has invalid value
    And Check if error message of "אימייל" is "דוא''ל לא תקין"
    Examples:
    | email                           |
    | a@b.com.com.com.com             |
    | a@b.com.com.comcccc.com         |
    | A@B.COM                         |
    | a%@b.com                        |
    | a_----___---_____r@b.com        |
    | a+r@b.com                       |
    | A@b.cOm                         |

  @form
  Scenario Outline: phoneNumber valid value test
    Given I navigate to "PlaceContainer" page
    When I write "<phone_number>" in "מספר טלפון נייד"
    Then Check field "מספר טלפון נייד" has valid value
    And Validate that "מספר טלפון נייד" have the input with only numbers
    Examples:
    | phone_number  |
    | 052-7878787   |
    | 056-8907495   |
    | 077-8748576   |
    | 059-3247857   |

   @form
  Scenario Outline: phoneNumber invalid value test
    Given I navigate to "PlaceContainer" page
    When I write "<phone_number>" in "מספר טלפון נייד"
    Then Check field "מספר טלפון נייד" has valid value
    And Validate that "מספר טלפון נייד" have the input with only numbers
    Examples:
    | phone_number |
    | sjh-skjsksj  |
    | sdsasasdd    |
    | gregwe$%f    |
    | @#$%^&*(7    |
    | dka-dsasdas   |
    | 052-sdks2j2   |
    | 054-394832j   |
    | 035-יעחלךןח    |
    | 077-تلاتتاتن    |


  @form
  Scenario: phoneNumber empty field error message test
    Given I navigate to "PlaceContainer" page
    When I write " " in "מספר טלפון נייד"
    Then Check field "מספר טלפון נייד" has invalid value
    And Check if error message of "מספר טלפון נייד" is "חובה להזין מספר טלפון נייד"


  @form
  Scenario Outline: street valid value test
    Given I navigate to "PlaceContainer" page
    When I pick "<street>" in "רחוב"
    Examples:
    | street              |
    | מח'תאר אבו ד' עויסאת |
    | א - זבאדי           |
    | א - זרה             |
    | א דבה               |
    | א דמיר              |
    | אבו עוביידה סמטה 12  |
    | אבן חארת'ה סמ3       |
    | אגודת ספורט בית"ר    |
    | אורי בן ארי          |
    | אחמד אסעד דארי סמטה 7|

  @form
  Scenario Outline: container placement street valid value test
    Given I navigate to "PlaceContainer" page
    When I pick "<container_placement>" in "רחוב הצבת המכולה"
    Examples:
    | container_placement  |
    | מח'תאר אבו ד' עויסאת  |
    | א - זבאדי            |
    | א - זרה              |
    | א דבה                |
    | א דמיר               |
    | אבו עוביידה סמטה 12   |
    | אבן חארת'ה סמ3        |
    | אגודת ספורט בית"ר     |
    | אורי בן ארי           |
    | אחמד אסעד דארי סמטה 7  |

  @form
  Scenario Outline: start placement date valid value test
    Given I navigate to "PlaceContainer" page
    When I pick date of "<container_placement_date>" in "מתאריך"
    Examples:
    | container_placement_date  |
    | 12/4/2023 16:00           |
    | 15/3/2023 17:30           |
    | 23/6/2023 15:33           |
    | 4/7/2023 12:00            |
    | 3/12/2023 14:13           |
    | 2/1/2023 12:55            |

  @form
  Scenario Outline: finish placement date valid value test
    Given I navigate to "PlaceContainer" page
    When I pick date of "<container_placement_date>" in "עד תאריך"
    Examples:
    | container_placement_date  |
    | 12/4/2023 16:00           |
    | 15/3/2023 17:30           |
    | 23/6/2023 15:33           |
    | 4/7/2023 12:00            |
    | 3/12/2023 14:13           |
    | 2/1/2023 12:55            |

  @form
  Scenario Outline: type of parking valid value test
    Given I navigate to "PlaceContainer" page
    When I pick "<parking_type>" in "סוג החניה"
    Examples:
    | parking_type                                       |
    | בחר את סוג החניה                                    |
    | מותרת                                              |
    | כחול-לבן                                           |
    | חנייה בפריקה וטעינה, חנייה באדום לבן, חנייה על המדרכה |
    | חניה חופשית (ללא סימון)                             |
    | תו אזורי                                           |


