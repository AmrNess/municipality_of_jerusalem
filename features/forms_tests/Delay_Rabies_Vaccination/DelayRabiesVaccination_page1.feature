Feature: Test for DelayRabiesVaccination Form Page1

  #excel 1
  Scenario: check form explanation
    Given I navigate to "DelayRabiesVaccination" page
    Then check the explanation tittle
    And check the explanation body


  Scenario Outline: check most field input
    Given I navigate to "DelayRabiesVaccination" page
    When I click on "next" button
    Then check if "<text>" error is "Mandatory_to_fill"
    Examples:
      | text                   |
      | מספר זהות:             |
      | שם פרטי:               |
      | שם משפחה:              |
      | מספר מספר טלפון נייד: |
      | אימייל:                |


  Scenario Outline: id check valid
    # check id field with valid values
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<id>" in "מספר זהות:"
    Then field "מספר זהות:" has Valid value
    And  check if "מספר זהות:" error is "מספר זהות שגוי"
    Then clear "מספר זהות:" field
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

  Scenario Outline: id check invalid
     # check id field with invalid values
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<id>" in "מספר זהות:"
    Then field "מספר זהות:" has inValid value
    And  check if "מספר זהות:" error is "NotNumber_error"
    Then clear "מספר זהות:" field
    Examples:
      | id                         |
      |                            |
      | 000000000                  |
      | 000000001                  |
      | 000000118                  |
      | 000000009                  |
      | 3121                       |
      | 34379818234336234724282    |
      | 92443232                   |
      | salem12321342133           |
      | salem12343457893r44677458  |
      | 83427961833                |
      | 3219                       |
      | 8883                       |
      | 0157                       |
      | 0180                       |
      | 22345556754                |
      | 23e23444322343355          |
      | 33sham344557895            |
      | 33ק'/דגגבשד344554897       |
      | 33ק'سببسث344567897         |
      | 33ק'/דגגכבבשד34557897      |
      | 33!@#$%3445765897          |
      | 33زسيhhjכעיח!@#$%344557457 |
      | 331133232ssd24312233       |
      | 01                         |
      | 231312324                  |
      | 453344553                  |
      | 612235427                  |
      | 322314466                  |
      | 613167101                  |
      | 213141517                  |
      | 293942999                  |
      | 135416541                  |
      | 224222424                  |
      | 108102581                  |
      | 233243236                  |
      | 154528136                  |
      | 160786030                  |
      #BUG
      | 1111111                    |
      | 12344                      |
      | 2222222                    |
      | 3333333                    |
      | 4444444                    |
      | 8888                       |
      | 1313                       |
      | 141                        |
      | 117                        |
      | 1115                       |

#BUG: first name and last name take infinity character
  Scenario Outline: first name check valid
    #check with valed names
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "שם פרטי"
    Then field "שם פרטי" has valid value
    And  check if "שם פרטי" error is "language_error"
    And clear "שם פרטי" field
    Examples:
      | text        |
      | ווסאם       |
      | יחלךףחיס    |
      | .יחלךףחיס   |
      | יחלךףחיס\   |
      | יחלךףחיס()- |
      | יחלךףחיס_   |
      | יחלךףחיס,   |
      | יחלךףחיס    |

#BUG : input field take the all without error massage
  Scenario Outline: first name check invalid
    #check with invaled names
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "שם פרטי"
    Then field "שם פרטי" has inValid value
    And  check if "שם פרטי" error is "language_error"
    Then clear "שם פרטי" field
    Examples:
      | text              |
      |                   |
      | אבגד/()'.,_-זחט12 |
      | אבגד/()'.,_-זחט!  |
      | אבגד/()'.,_-זחט@  |
      | אבגד/()'.,_-זחט#  |
      | אבגד/()'.,_-זחט$  |
      | אבגד/()'.,_-זחט%  |
      | אבגד/()'.,_-זחט^  |
      | אבגד/()'.,_-זחט&  |
      | אבגד/()'.,_-זחט*  |
      | אבגד/()'.,_-זחט+  |
      | אבג/12            |
      | דהו!              |
      | זחט@              |
      | יכל#              |
      | מנס$              |
      | פצק%              |
      | רשת^              |
      | בגדי&             |
      | הוזח*             |
      | לכמנ+             |
      | אבג/12            |
      | דהו!              |
      | זחט@              |
      | יכל#              |
      | מנס$              |
      | פצק%              |
      | רשת^              |
      | בגדי&             |
      | הוזח*             |
      | לכמנ+             |
      | אבג/()            |
      | רשת12             |
      | בגדי!             |
      | הוזח@             |
      | לכמנ#             |
      | يصييس             |
      | وسام@             |
      | محمد3             |


  Scenario Outline: last name check valid
    #check with valed names
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "שם משפחה"
    Then field "שם משפחה" has valid value
    And  check if "שם משפחה" error is "language_error"
    Then clear "שם משפחה" field
    Examples:
      | text        |
      | ווסאם       |
      | יחלךףחיס    |
      | .יחלךףחיס   |
      | יחלךףחיס\   |
      | יחלךףחיס()- |
      | יחלךףחיס_   |
      | יחלךףחיס,   |
      | יחלךףחיס    |

    #BUG : input field take the all without error massage
  Scenario Outline: last name check invalid
    #check with invaled names
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "שם משפחה"
    Then field "שם משפחה" has inValid value
    And  check if "שם משפחה" error is "language_error"
    Then clear "שם משפחה" field
    Examples:
      | text              |
      |                   |
      | אבגד/()'.,_-זחט12 |
      | אבגד/()'.,_-זחט!  |
      | אבגד/()'.,_-זחט@  |
      | אבגד/()'.,_-זחט#  |
      | אבגד/()'.,_-זחט$  |
      | אבגד/()'.,_-זחט%  |
      | אבגד/()'.,_-זחט^  |
      | אבגד/()'.,_-זחט&  |
      | אבגד/()'.,_-זחט*  |
      | אבגד/()'.,_-זחט+  |
      | אבג/12            |
      | דהו!              |
      | זחט@              |
      | יכל#              |
      | מנס$              |
      | פצק%              |
      | רשת^              |
      | בגדי&             |
      | הוזח*             |
      | לכמנ+             |
      | אבג/12            |
      | דהו!              |
      | זחט@              |
      | יכל#              |
      | מנס$              |
      | פצק%              |
      | רשת^              |
      | בגדי&             |
      | הוזח*             |
      | לכמנ+             |
      | אבג/()            |
      | רשת12             |
      | בגדי!             |
      | הוזח@             |
      | לכמנ#             |
      | يصييس             |
      | وسام@             |
      | محمد3             |

  Scenario Outline: Delivery Date with valid values
    Given Navigate to "DelayRabiesVaccination" Page
    When Click on "תאריך לידה:" field
    And Clear "תאריך לידה:" field
    And Fill "תאריך לידה:" field  with "<Date>"
    Then Validate if "תאריך לידה:" field  has valid value
    Examples:
      | Date         |
      | 12/12/1988   |
      | 04/05/2000   |
      | 04042005     |
      | 04-04-2000   |
      | 04/04.2000   |
      | 24/12/2001   |
      | 3012/2000    |
      | a22/11/a2022 |

  Scenario Outline: Delivery Date with Invalid values
    Given Navigate to "DelayRabiesVaccination" Page
    When Click on "תאריך לידה:" field
    And Clear "תאריך לידה:" field
    And Fill "תאריך לידה:" field  with "<Date>"
    Then Validate if "תאריך לידה:" field  has Invalid value
    Examples:
      | Date         |
      |              |
      | 3012/2000    |
      | a22/11/a2022 |


  Scenario Outline: street valid check
    Given I navigate to "DelayRabiesVaccination" page
    When I scroll to value "<text>" and "רחוב"
    Then field "רחוב" has valid value
    And  check if "רחוב" in jerusalem
    And  check if "רחוב" error is "wrong_select"
    Then clear "רחוב" field
    Examples:
      | text   |
      | א טברי |
      | החוצה  |
      | הטורים |

  Scenario Outline: street invalid check
    Given I navigate to "DelayRabiesVaccination" page
    When I scroll to value "<text>" and "רחוב"
    Then field "רחוב" has inValid value
    And  check if "רחוב" in jerusalem
    And  check if "רחוב" error is "wrong_select"
    Then clear "רחוב" field
    Examples:
      | text |
      | 1    |
      | 11   |
      | 12   |
      | 24   |


  Scenario Outline: home number valid check
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "מספר בית"
    Then field "מספר בית" has valid value
    And  check if "מספר בית" error is "לא תקין"
    Then clear "מספר בית" field
    Examples:
      | text   |
      | 123456 |
      | 11234  |

  Scenario Outline: home number invalid check
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "מספר בית"
    Then field "מספר בית" has inValid value
    And  check if "מספר בית" error is "לא תקין"
    Then clear "מספר בית" field
    Examples:
      | text     |
      |          |
      | 12345678 |
      | 1234     |


  Scenario Outline: Apartment number valid check
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "מספר דירה"
    Then field "מספר דירה"has valid value
    And  check if "מספר דירה"error is "NotNumber_error"
    Then clear "מספר דירה"field
    Examples:
      | text |
      | 1    |
      | 11   |
      | 12   |
      | 24   |

  Scenario Outline: Apartment number invalid check
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "מספר דירה"
    Then field "מספר דירה" has inValid value
    And  check if "מספר דירה" error is "NotNumber_error"
    Then clear "מספר דירה" field
    Examples:
      | text                                                      |
      |                                                           |
      #BUG
      | 111111111111111111111111111111111111111111111111111111111 |


  Scenario Outline: phone number check valid
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "מספר טלפון:"
    Then field "מספר טלפון ניידמספר טלפון:" has valid value
    And  check if "מספר טלפון:" error is "יש להזין ספרות בלבד"
    Then clear "מספר טלפון:" field
    Examples:
      | text       |
      | 0521212131 |
      | 0544075877 |
      | 0503333333 |

  Scenario Outline: phone number check invalid
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "מספר טלפון:"
    Then field "מספר טלפון:" has inValid value
    And  check if "מספר טלפון:" error is "יש להזין ספרות בלבד"
    Then clear "מספר טלפון:" field
    Examples:
      | text        |
      | ווסאם       |
      | ווס 22אם    |
      | asdasd      |
      | @Dd$WDC223  |
      | number      |
      | sjh-skjsksj |
      | sdsasasdd   |
      | gregwe$%f   |
      | @#$%^&*(7   |
      | 1111        |
      |             |

  Scenario Outline: mobile three number check valid
    Given I navigate to "DelayRabiesVaccination" page
    When I picked value "<text>" and "dropDownPhone"
    And  check if "dropDownPhone" error is "wrong_choice"
    Then clear "dropDownPhone" field
    Examples:
      | text |
      | 050  |
      | 052  |
      | 053  |
      | 054  |
      | 055  |
      | 056  |
      | 057  |
      | 058  |
      | 077  |
      | 051  |
      | 059  |

  Scenario Outline: mobile three number check inValid
    Given I navigate to "DelayRabiesVaccination" page
    When I picked value "<text>" and "dropDownPhone"
    And  check if "dropDownPhone" error is "wrong_choice"
    Then clear "dropDownPhone" field
    Examples:
      | text |
      | 02   |
      | 001  |
      | 123  |


  Scenario Outline: mobile number check valid
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "מספר טלפון נייד:"
    Then field "מספר טלפון נייד:" has valid value
    And  check if "מספר טלפון נייד:" error is "יש להזין ספרות בלבד"
    Then clear "מספר טלפון נייד:" field
    Examples:
      | text    |
      | 1212131 |
      | 4075877 |
      | 3333333 |

  Scenario Outline: mobile number check invalid
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "מספר טלפון נייד:"
    Then field "מספר טלפון נייד:" has inValid value
    And  check if "מספר טלפון נייד:" error is "יש להזין ספרות בלבד"
    Then clear "מספר טלפון נייד:" field
    Examples:
      | text        |
      | ווסאם       |
      | ווס 22אם    |
      | asdasd      |
      | @Dd$WDC223  |
      | number      |
      | sjh-skjsksj |
      | sdsasasdd   |
      | gregwe$%f   |
      | @#$%^&*(7   |
      | 1111        |
      |             |


  Scenario Outline: fax number check valid
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "מספר פקס:"
    Then field "מספר פקס:" has valid value
    And  check if "מספר פקס:" error is "יש להזין ספרות בלבד"
    Then clear "מספר פקס:" field
    Examples:
      | text       |
      | 0234567899 |
      | 024075877  |
      | 023333333  |

  Scenario Outline: fax number check invalid
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "מספר פקס:"
    Then field "מספר פקס:" has inValid value
    And  check if "מספר פקס:" error is "יש להזין ספרות בלבד"
    Then clear "מספר פקס:" field
    Examples:
      | text        |
      | ווסאם       |
      | ווס 22אם    |
      | asdasd      |
      | @Dd$WDC223  |
      | number      |
      | sjh-skjsksj |
      | sdsasasdd   |
      | gregwe$%f   |
      | @#$%^&*(7   |
      | 1111        |
      |             |


  Scenario Outline: email check valid
    #check with valed emails
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<email>" in 'אימייל:'
    Then field 'אימייל:' has valid value
    And  check if 'אימייל:' error is "email_error"
    Then clear 'אימייל:' field
    Examples:
      | email             |
      | sda32sd@dyj.com   |
      | rtyu@sd.com       |
      | qw@hj.com         |
      | qw@hj.asd.com     |
      | qwd@d.com         |
      | assd@b.sas.com    |
      | asasd@grgb.com    |
      | aqaws@bfew.com    |
      | fewfas@fefsab.com |
      | awdas@efadsb.com  |


  Scenario Outline: email check invalid
    #check with invaled emails
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in 'אימייל:'
    Then field 'אימייל:' has inValid value
    And  check if 'אימייל:' error is "email_error"
    Then clear 'אימייל:' field

    Examples:
      | text                      |
      | אבגד/()'.,_-זחט12         |
      | אבגד/()'.,_-זחט!          |
      | אבגד/()'.,_-זחט@          |
      | אבגד/()'.,_-זחט#          |
      | אבגד/()'.,_-זחט$          |
      | אבגד/()'.,_-זחט%          |
      | אבגד/()'.,_-זחט^          |
      | אבגד/()'.,_-זחט&          |
      | אבגד/()'.,_-זחט*          |
      | אבגד/()'.,_-זחט+          |
      | אבג/12                    |
      | דהו!                      |
      | זחט@                      |
      | יכל#                      |
      | מנס$                      |
      | פצק%                      |
      | רשת^                      |
      | בגדי&                     |
      | הוזח*                     |
      | לכמנ+                     |
      | אבג/12                    |
      | דהו!                      |
      | זחט@                      |
      | יכל#                      |
      | מנס$                      |
      | פצק%                      |
      | רשת^                      |
      | בגדי&                     |
      | הוזח*                     |
      | לכמנ+                     |
      | אבג/()                    |
      | רשת12                     |
      | בגדי!                     |
      | הוזח@                     |
      | לכמנ#                     |
      | يصييس                     |
      | وسام@                     |
      | محمد3                     |
      | a@b...דג..............com |
      | 2w@w.....com              |
      | a@b.com.12سيsd#%          |
      | aس@b.com                  |
      | A@f@h$.com                |
      | a.b@c.d@d.com             |
      | dgh.@gjj.com              |
      | dfghj.dfghj@@j.com        |
      #BUG:
      | a@b.com.com.com.com       |
      | a@b.com.com.comcccc.com   |
      | A@B.COM                   |
      | a%@b.com                  |
      | a_----___---_____r@b.com  |
      | a+r@b.com                 |
      | A@b.cOm                   |
      | w@w                       |
      | 2w@w.com                  |
      | a@b.com.سيسي              |
      | A$h@B.com                 |


  Scenario Outline: postal valid check
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "מי1קוד"
    Then field "מיקוד" has valid value
    And  check if "מיקוד" error is "מיקוד לא תקין"
    Then clear "מיקוד" field
    Examples:
      | text   |
      | 123456 |
      | 11234  |

  Scenario Outline: postal invalid check
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<text>" in "מיקוד"
    Then field "מיקוד" has inValid value
    And  check if "מיקוד" error is "מיקוד לא תקין"
    Then clear "מיקוד" field
    Examples:
      | text     |
      |          |
      | 12345678 |
      | 1234     |
      | 1234      |



  Scenario Outline: chack all the fields
    Given I navigate to "DelayRabiesVaccination" page
    When I write "<id>" in "מספר זהות:"
    And I write "<fname>" in "שם פרטי"
    And I write "<lname>" in "שם משפחה"
    And Fill "תאריך לידה:" field  with "<dateBirth>"
    When I write "<streer>" in "רחוב"
    And I write "<home>" in "מספר בית"
    When I write "<apartment>" in "מספר דירה"
    And I write "<extraPhone>" in "מספר טלפון:"
    And I picked value "<3num>" and "מספר טלפון נייד:"
    And I write "<phone>" in "מספר טלפון נייד:"
    And I write "<faxNum>" in "מספר פקס:"
    And I write "<email>" in "אימייל:"
    And I write "<postal>" in "מיקוד"
    And I click on "next" button
    Examples:
      | id        | fname | lname | dateBirth  | streer | home | apartment | extraPhone | 3num | phone   | faxNum    | email   | postal |
      |           |       |       |            |        |      |           |            |      |         |           |         |        |
      | 111111100 | ווסאם | עוקה  | 12-12-2012 | א טברי | 1    | 1         | 0504075877 | 052  | 4075877 | 024075877 | w@w.com |        |
      | 111111100 | ווסאם | עוקה  | 12-12-2012 | א טברי | 1    | 1         | 0504075877 | 052  | 4075877 | 024075877 |         | 1      |
      | 111111100 | ווסאם | עוקה  | 12-12-2012 | א טברי | 1    | 1         | 0504075877 | 052  | 4075877 |           | w@w.com | 1      |
      | 111111100 | ווסאם | עוקה  | 12-12-2012 | א טברי | 1    | 1         | 0504075877 | 052  |         | 024075877 | w@w.com | 1      |
      | 111111100 | ווסאם | עוקה  | 12-12-2012 | א טברי | 1    | 1         | 0504075877 |      | 4075877 | 024075877 | w@w.com | 1      |
      | 111111100 | ווסאם | עוקה  | 12-12-2012 | א טברי | 1    | 1         |            | 052  | 4075877 | 024075877 | w@w.com | 1      |
      | 111111100 | ווסאם | עוקה  | 12-12-2012 | א טברי | 1    |           | 0504075877 | 052  | 4075877 | 024075877 | w@w.com | 1      |
      | 111111100 | ווסאם | עוקה  | 12-12-2012 |        |      | 1         | 0504075877 | 052  | 4075877 | 024075877 | w@w.com | 1      |
      | 111111100 | ווסאם | עוקה  |            | א טברי | 1    | 1         | 0504075877 | 052  | 4075877 | 024075877 | w@w.com | 1      |
      | 111111100 | ווסאם |       | 12-12-2012 | א טברי | 1    | 1         | 0504075877 | 052  | 4075877 | 024075877 | w@w.com | 1      |
      | 111111100 |       | עוקה  | 12-12-2012 | א טברי | 1    | 1         | 0504075877 | 052  | 4075877 | 024075877 | w@w.com | 1      |
      |           | ווסאם | עוקה  | 12-12-2012 | א טברי | 1    | 1         | 0504075877 | 052  | 4075877 | 024075877 | w@w.com | 1      |





  Scenario : save form
    Given I navigate to "DelayRabiesVaccination" page
    When I click on header "שמור" button
    And save all input field values
    Then check "massage" and "date" saved form
    When click ok massage alert
    Then check page step
    And check all input field values


  Scenario : print page
    Given I navigate to "DelayRabiesVaccination" page
    When I click on header "הדפס" button
    When check preview page
    Then click "action"
