Feature: Basic Test for ContractorEmpRights Form Page


  @header
  # excel sheet rule number 1
  Scenario: Check explanation of form
    Given I navigate to "ContractorEmpRights" page
    When Is application information tittle is "הסבר למילוי הטופס:"
    And Check if application explanation have text

  @header
  # excel sheet rule number 21
  Scenario: Check Print display
    Given I navigate to "ContractorEmpRights" page
    When I click on "הדפס" button
    And Check if Print display is clear




  @form
  # excel sheet rule number 11
  Scenario : full scenario for the page test (valid)
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
    Then validate that you have information in the fields that you filled


  @form
  # excel sheet rule number 18
  Scenario : Check if the mandatory are invalid
    Given I navigate to "CollectiveLifeInsurance" page
    When I click on "שמור" button
    Then Validate that you are in the same page
    And Check if "מספר זהות" has "יש להזין מספר זהות" message
    And Check if "שם פרטי" has "יש למלא שם פרטי" message
    And Check if "שם משפחה" has "יש למלא שם משפחה" message
    And Check if "מספר טלפון נייד" has "חובה להזין מספר טלפון נייד" message
    And Check if "אימייל" has "חובה להזין כתובת אימייל" message
    And Check if "ענף" has "יש לבחור ענף" message
    And Check if "שם חברה" has "יש לבחור שם חברה" message
    And Check if "תאריך תחילת העבודה בחברה" has "יש לסמן תאריך תחילת עבודה" message
    And Check if "נושא התלונה" has "יש לבחור את נושא/י התלונה" message
    And Check if "פרטי התלונה" has "יש למלא את פרטי התלונה" message
    And Check if "חודשים לבדיקה" has "נא למלא שנה נא למלא חודש/ים" message
    And Check if "האם היתה פניה למעסיק קודם הגשת תלונה זו" has "יש לסמן האם היתה פניה למעסיק קודם הגשת תלונה זו" message




   @form
   # excel sheet rule number 3
  Scenario Outline: id value test (valid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<id>" in "מספר זהות"
    Then Check field "מספר זהות" has valid value
    Examples:
    | id  |
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
  # excel sheet rule number 3
  Scenario Outline: id value test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<id>" in "מספר זהות"
    Then Check field "מספר זהות" has invalid value
    Examples:
    | id  |
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
  # excel sheet rule number 3
  # BUG:
  # Another BUG : the id that contains one number until unlimited
  Scenario Outline: id value test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<id>" in "מספר זהות"
    Then Check field "מספר זהות" has invalid value
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

    @form
    # excel sheet rule number 18
    Scenario Outline: id error message test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<id>" in "מספר זהות"
    Then Check field "מספר זהות" has invalid value
    And Check if error message is "מספר זהות לא תקין"
    Examples:
    | id  |
    | 000000001                     |
    | 000000118                     |
    | 000000009                     |
    | 3121                          |
    | 92443232                      |
    | 3219                          |
    | 8883                          |
    | 0157                          |
    | 0180                          |
    | 01                            |



  @form
  # excel sheet rule number 18
  # BUG:
  Scenario Outline: id error message test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<id>" in "מספר זהות"
    Then Check field "מספר זהות" has invalid value
    And Check if error message is "מספר זהות לא תקין"
    Examples:
    | id  |
    | 000000000                     |
    | 000000018                     |
    | 3327981827336443728282        |
    | 33279618433                   |
    | 22345567754                   |
    | 331133232ssd2321312233        |
    | 00                            |



  @form
  # excel sheet rule number 5
  Scenario Outline: id,house number, apartment_number value allow to write just numbers test (valid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<id>" in "מספר זהות"
    And I write "<house_number>" in "מספר בית"
    And I write "<apartment_number>" in "מספר דירה"
    Then Check field "מספר זהות" has valid value
    And Check field "מספר בית" has valid value
    And Check field "מספר דירה" has valid value
    And Validate that "מספר זהות" have the input with only numbers
    And Validate that "מספר בית" have the input with only numbers
    And Validate that "מספר דירה" have the input with only numbers
    # the id field accept all letters in all languages and signs, for that i put just numbers in the id field
    Examples:
    | id        |house_number  | apartment_number |
    | 356534567 | 356534567    | 356534567        |
    | 356534567 | 22334ttfd    | 22334ttfd        |
    | 356534567 | 112gdds40    | 112gdds40        |
    | 356534567 | 22sdfs440    | 22sdfs440        |
    | 356534567 | 111#$%&00    | 111#$%&00        |
    | 356534567 | 223עיחל57    | 223עיחל57        |
    | 356534567 | 223بتتن39    | 223بتتن39        |
    | 356534567 | 5$^%56745    | 5$^%56745        |
    | 356534567 | 1212@@$20    | 1212@@$20        |
    | 356534567 | 0088OIk80    | 0088OIk80        |
    | 356534567 | 433opl433    | 433opl433        |
    | 356534567 | 75כע23133    | 75כע23133        |
    | 356534567 | ראטוןןלםם    | ראטוןןלםם         |
    | 356534567 | المينسةؤن    | المينسةؤن         |
    | 356534567 | dlkjhokjl   | dlkjhokjl        |


   @form
  # excel sheet rule number 5
  # BUG:
  Scenario Outline: id,house number, apartment_number value allow to write just numbers test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<id>" in "מספר זהות"
    And I write "<house_number>" in "מספר בית"
    And I write "<apartment_number>" in "מספר דירה"
    Then Check field "מספר זהות" has invalid value
    And Check field "מספר בית" has valid value
    And Check field "מספר דירה" has valid value
    And Validate that "מספר זהות" have the input with only numbers
    And Validate that "מספר בית" have the input with only numbers
    And Validate that "מספר דירה" have the input with only numbers
    Examples:
    | id         |house_number  | apartment_number|
    | 457756e67  | 457756e67    | 457756e67       |
    | e56765786  | e56765786    | e56765786       |
    | 56877e456  | 56877e456    | 56877e456       |
    | 45658987e  | 45658987e    | 45658987e       |
    | 5e6787679  | 5e6787679    | 5e6787679       |
    | 356534567 | 5e6787679    | 45658987e        |
    | 22334ttfd | 5e6787679    | 45658987e        |
    | 112gdds40 | 5e6787679    | 45658987e        |
    | 22sdfs440 | 5e6787679    | 45658987e        |
    | 111#$%&00 | 5e6787679    | 45658987e        |
    | 223עיחל57 | 5e6787679     | 45658987e       |
    | 223بتتن39 | 5e6787679     | 45658987e       |
    | 5$^%56745 | 5e6787679    | 45658987e        |
    | 1212@@$20 | 5e6787679    | 45658987e        |
    | 0088OIk80 | 5e6787679    | 45658987e        |
    | 433opl433 | 5e6787679    | 45658987e        |
    | 75כע23133 | 5e6787679    | 45658987e        |
    | ראטוןןלםם  | 5e6787679    | 45658987e        |
    | المينسةؤن  | 5e6787679    | 45658987e        |
    | dlkjhokjl | 5e6787679    | 45658987e        |




    @form
   # excel sheet rule number 4
  Scenario Outline: all text field allow to write just Hebrew test (valid)
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
  # excel sheet rule number 4
  # fields of first name and last name and street accept all languages and signs
  # BUG:
  # Another BUG : the first name accept first name, last name,street, city site name that contains one letter until unlimited
  Scenario Outline: all text field allow to write just Hebrew test (invalid)
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
  # excel sheet rule number 18
  # error message for empty field
  Scenario: error message for first name field (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write " " in "שם פרטי"
    Then Check field "שם פרטי" has invalid value
    And Check if error message is "יש למלא שם פרטי"


  @form
  # excel sheet rule number 18
  # error message for wrong input
  # BUG:
  Scenario Outline: error message for first name field (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<first_name>" in "שם פרטי"
    Then Check field "שם פרטי" has invalid value
    And Check if error message is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | first_name            |
    |   firas               |
    |   asdas               |
    |   fiwrqrwwras         |
    |   firdasd3r3ras       |

  @form
  # excel sheet rule number 18
  # error message for empty field
  Scenario: error message for last name field (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write " " in "שם משפחה"
    Then Check field "שם משפחה" has invalid value
    And Check if error message is "יש למלא שם משפחה"

  @form
  # excel sheet rule number 18
  # error message for wrong input
  # BUG:
  Scenario Outline: error message for last name field (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<last_name>" in "שם משפחה"
    Then Check field "שם משפחה" has invalid value
    And Check if error message is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | last_name             |
    |   firas               |
    |   asdas               |
    |   fiwrqrwwras         |
    |   firdasd3r3ras       |

  @form
  # excel sheet rule number 18
  # error message for wrong input
  # BUG:
  Scenario Outline: error message for web url field (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<street>" in "רחוב"
    Then Check field "רחוב" has invalid value
    And Check if error message is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | street                |
    |   sfsafsafasd         |
    |   גכעיחלךכעיחל         |
    |   بلاتنم%^&*[لأأـ،قفإ‘÷  |

  @form
  # excel sheet rule number 18
  # error message for wrong input
  # BUG:
  Scenario Outline: error message for web url field (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<city_site_name>" in "שם אתר עירוני"
    Then Check field "שם אתר עירוני" has invalid value
    And Check if error message is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | city_site_name        |
    |   sfsafsafasd         |
    |   גכעיחלךכעיחל         |
    |   بلاتنم%^&*[لأأـ،قفإ‘÷  |

  @form
  # excel sheet rule number 6
  Scenario Outline: email field allow to write just english and numbers test (valid)
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
  # excel sheet rule number 6
  Scenario Outline: email field allow to write just english and numbers test (invalid)
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
  # excel sheet rule number 6
  # BUG:
  # Another BUG : the email that contains one letter until unlimited
  Scenario Outline: email field allow to write just english and numbers test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<email>" in "אימייל"
    Then Check field "אימייל" has invalid value
    And Validate that "אימייל" have the input only english, numbers with the allowed signs
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
  # excel sheet rule number 18
  # error message for wrong input
  Scenario Outline: email error message test for wrong input (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<email>" in "אימייל"
    Then Check field "אימייל" has invalid value
    And Check if error message is "דוא''ל לא תקין"
    Examples:
    | email  |
    | a@b...דג..............com    |
    | a@b.com.سيسي                 |
    | a@b.com.12سيsd#%             |
    | aس@b.com                     |
    | A$h@B.com                    |
    | A@f@h$.com                   |


  @form
  # excel sheet rule number 18
  # error message for wrong input
  # BUG:
  Scenario Outline: email error message test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<email>" in "אימייל"
    Then Check field "אימייל" has invalid value
    And Check if error message is "דוא''ל לא תקין"
    Examples:
    | email  |
    | a@b.com.com.com.com          |
    | a@b.com.com.comcccc.com      |
    | A@B.COM                      |
    | a%@b.com                     |
    | a_----___---_____r@b.com     |
    | a+r@b.com                    |
    |A@b.cOm                       |

  @form
 # excel sheet rule number 5
  Scenario Outline: phone number field allow to write just numbers test (valid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<phone_number>" in "מספר טלפון נייד"
    Then Check field "מספר טלפון נייד" has valid value
    And Validate that "מספר טלפון נייד" have the input with only numbers
    Examples:
    | phone_number  |
    | 0527878787   |
    | 0568907495   |
    | 0778748576   |
    | 0597247857   |


  @form
  # excel sheet rule number 5
  # the field refuse all the letters
  # BUG:
  Scenario Outline: phone number field allow to write just numbers test (invalid)
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
  # excel sheet rule number 18
  # error message for empty phone number
  Scenario: phone number error message test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write " " in "מספר טלפון נייד"
    Then Check field "מספר טלפון נייד" has invalid value
    And Check if error message is "יש להזין מספר טלפון נייד"

  @form
  # excel sheet rule number 18
  # error message for wrong phone number
  Scenario Outline: phone number error message test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<phone_number>" in "מספר טלפון נייד"
    Then Check field "מספר טלפון נייד" has invalid value
    And Check if error message is "יש להזין ספרות בלבד"
    Examples:
    | phone_number  |
    | dkadsasdas   |
    | 052sdks2j2   |
    | 054394832j   |
    | 035יעחלךןח    |
    | 077تلاتتاتن    |


  @form
  # excel sheet rule number 18
  # error message for incomplete phone number
  # BUG:
  Scenario Outline: phone number error message test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<phone_number>" in "מספר טלפון נייד"
    Then Check field "מספר טלפון נייד" has invalid value
    And Check if error message is "ש להשלים את הספרות החסרות"
    Examples:
    | phone_number  |
    | 0522   |
    | 05234  |
    | 054567 |


  @form
  # excel sheet rule number 5
  # BUG:
  Scenario Outline: home phone number field allow to write just numbers test (valid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<home_phone_number>" in "מספר טלפון"
    Then Check field "מספר טלפון" has valid value
    And Validate that "מספר טלפון" have the input with only numbers
    Examples:
    | home_phone_number  |
    | 027878787   |
    | 068907495   |
    | 078748576   |
    | 053247857   |


  @form
  # excel sheet rule number 5
  # the field refuse all the letters
  # BUG:
  Scenario Outline: home phone number field allow to write just numbers test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<home_phone_number>" in "מספר טלפון"
    Then Check field "מספר טלפון" has invalid value
    And Validate that "מספר טלפון" have the input with only numbers
     Examples:
    | home_phone_number |
    | sjh-skjsksj  |
    | sdsasasdd    |
    | gregwe$%f    |
    | @#$%^&*(7    |


  @form
  # excel sheet rule number 18
  # error message for wrong phone number
  Scenario Outline: home phone number error message test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<home_phone_number>" in "מספר טלפון"
    Then Check field "מספר טלפון" has invalid value
    And Check if error message is "יש להזין ספרות בלבד"
    Examples:
    | home_phone_number  |
    | dka-dsasdas   |
    | 052-sdks2j2   |
    | 054-394832j   |
    | 035-יעחלךןח    |
    | 077-تلاتتاتن    |

  @form
  # excel sheet rule number 18
  # error message for incomplete phone number
  # BUG:
  Scenario Outline: home phone number error message test (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<home_phone_number>" in "מספר טלפון"
    Then Check field "מספר טלפון" has invalid value
    And Check if error message is "ש להשלים את הספרות החסרות"
    Examples:
    | home_phone_number  |
    | 0522   |
    | 05234  |
    | 054567 |



  @form
  Scenario Outline: birthday date value test (valid)
    Given I navigate to "ContractorEmpRights" page
    When I pick date of "<birthday_date>" in "תאריך לידה"
    Examples:
    | birthday_date |
    | 12/4/1990  |
    | 15/3/1997  |
    | 23/6/2000  |
    | 4/7/2020   |
    | 3/12/2017  |
    | 2/1/2018   |



  @form
  Scenario Outline: branch value test (valid)
    Given I navigate to "PlaceContainer" page
    When I pick "<branch>" in "ענף"
    Examples:
    | branch  |
    | הסעדה   |
    | שמירה   |
    | ניקיון  |

  @form
  Scenario Outline: company name value test (valid)
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
  Scenario Outline: date of starting work in the company value test (valid)
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
  Scenario Outline: company name value test (valid)
    Given I navigate to "PlaceContainer" page
    When I pick "<complaint_subject>" in "נושא התלונה"
    Examples:
    | complaint_subject                                          |
    | ניהול פנקס שעות עבודה                                       |
    | תשלומי שכר בגין השתתפות במטווחים, השתלמויות וקורסי ריענון ירי  |
    | מתן הודעה לעובד                                             |
    | דמי נסיעות                                                  |





    @form
   # excel sheet rule number 4
  Scenario Outline: all text field allow to write just Hebrew test (valid)
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
  # excel sheet rule number 4
  # field of Details of the complaint accept all languages and signs
  # BUG:
  Scenario Outline: all text field allow to write just Hebrew test (invalid)
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
  # excel sheet rule number 18
  # error message for empty field
  Scenario: error message for complaint details field (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write " " in "פרטי התלונה"
    Then Check field "פרטי התלונה" has invalid value
    And Check if error message is "יש למלא את פרטי התלונה"

  @form
  # excel sheet rule number 18
  # error message for wrong input
  # BUG:
  Scenario Outline: error message for complaint details field (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<complaint_details>" in "פרטי התלונה"
    Then Check field "פרטי התלונה" has invalid value
    And Check if error message is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | complaint_details      |
    |   firas                |
    |   asdas                |
    |   fiwrqrwwras          |
    |   firdasd3r3ras        |
    |   بلاتنمؤبلاتنمكلات        |



  @form
  Scenario: question value test (valid)
    Given I navigate to "ContractorEmpRights" page
    When Choose "כן" in "האם היתה פניה למעסיק קודם הגשת תלונה זו"




  @form
  # excel sheet rule number 4
  Scenario Outline: all text field allow to write just Hebrew test (valid)
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
  # excel sheet rule number 4
  # field of Details of the complaint accept all languages and signs
  # BUG:
  # Another BUG : the answer you got that contains one letter until unlimited
  Scenario Outline: all text field allow to write just Hebrew test (invalid)
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


  @form
  # excel sheet rule number 18
  # error message for wrong input
  # BUG:
  Scenario Outline: error message for answer you got field (invalid)
    Given I navigate to "ContractorEmpRights" page
    When I write "<answer_you_got>" in "התשובה שקיבלתי"
    Then Check field "התשובה שקיבלתי" has invalid value
    And Check if error message is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | answer_you_got      |
    |   firas             |
    |   asdas             |
    |   fiwrqrwwras       |
    |   firdasd3r3ras     |
    |   بلاتنمؤبلاتنمكلات     |


    @form
    Scenario Outline: months to check value test (valid)
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