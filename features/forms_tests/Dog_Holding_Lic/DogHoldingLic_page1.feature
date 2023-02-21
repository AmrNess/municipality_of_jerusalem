Feature: Test for DogHoldingLic Form Page

  #excel 1
  Scenario: check form explanation
    Given I navigate to "DogHoldingLic" page
    Then check the explanation tittle
    And check the explanation body

  Scenario Outline: radio choice identityType valid
    Given I navigate to "DogHoldingLic" page
    When I choice value "<text>" in "identityType"
    Then validate "identityType" the chosen option is valid
    And check if "<text>" active
    Examples:
      | text  |
      | ת.ז.  |
      | דרכון |

  Scenario Outline: radio choice identityType invalid
    Given I navigate to "DogHoldingLic" page
    When I choice value "<text>" in "identityType"
    Then validate "identityType" the chosen option is inValid
    And check if "<text>" active
    Examples:
      | text |
      | dd   |
      | דג   |


  Scenario Outline: id check valid
    # check id field with valid values
    Given I navigate to "DogHoldingLic" page
    When I write "<id>" in "מספר מזהה:"
    Then field "מספר מזהה:" has Valid value
    And  check if "מספר מזהה:" error is "מספר זהות שגוי"
    Then clear "מספר מזהה:" field
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
    Given I navigate to "DogHoldingLic" page
    When I write "<id>" in "מספר מזהה:"
    Then field "מספר מזהה:" has inValid value
    And  check if "מספר מזהה:" error is "NotNumber_error"
    Then clear "מספר מזהה:" field
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
    Given I navigate to "DogHoldingLic" page
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
    Given I navigate to "DogHoldingLic" page
    When I write "<text>" in "שם פרטי"
    Then field "שם פרטי" has inValid value
    And  check if "שם פרטי" error is "language_error"
    Then clear "שם פרטי" field
    Examples:
      | text              |
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
    Given I navigate to "DogHoldingLic" page
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
    Given I navigate to "DogHoldingLic" page
    When I write "<text>" in "שם משפחה"
    Then field "שם משפחה" has inValid value
    And  check if "שם משפחה" error is "language_error"
    Then clear "שם משפחה" field
    Examples:
      | text              |
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

  Scenario: chick city not editable
    Given I navigate to "DogHoldingLic" page
    Then check if the field editable
    And check the city is "ירושלים"


  Scenario Outline: street valid check
    Given I navigate to "DogHoldingLic" page
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
    Given I navigate to "DogHoldingLic" page
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
    Given I navigate to "DogHoldingLic" page
    When I write "<text>" in "מספר בית"
    Then field "מספר בית" has valid value
    And  check if "מספר בית" error is "language_error"
    Then clear "מספר בית" field
    Examples:
      | text |
      | 1    |
      | 11   |
      | 12   |
      | 24   |

    #BUG: take the all
  Scenario Outline: home number invalid check
      Given I navigate to "DogHoldingLic" page
    When I write "<text>" in "מספר בית"
    Then field "מספר בית" has inValid value
    And  check if "מספר בית" error is "language_error"
    Then clear "מספר בית" field
    Examples:
      | text                                                      |
      |                                                           |
      | 111111111111111111111111111111111111111111111111111111111 |


  Scenario Outline: phone three number check valid
    Given I navigate to "DogHoldingLic" page
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

  Scenario Outline: phone three number check inValid
    Given I navigate to "DogHoldingLic" page
    When I picked value "<text>" and "dropDownPhone"
    And  check if "dropDownPhone" error is "wrong_choice"
    Then clear "dropDownPhone" field
    Examples:
      | text |
      | 02   |
      | 001  |
      | 123  |


  Scenario Outline: phone number check valid
    Given I navigate to "DogHoldingLic" page
    When I write "<text>" in "טלפון נייד"
    Then field "טלפון נייד" has valid value
    And  check if "טלפון נייד" error is "NotNumber_error"
    Then clear "טלפון נייד" field
    Examples:
      | text    |
      | 1212131 |
      | 4075877 |
      | 3333333 |

  Scenario Outline: phone number check invalid
    Given I navigate to "DogHoldingLic" page
    When I write "<text>" in "טלפון נייד"
    Then field "טלפון נייד" has inValid value
    And  check if "טלפון נייד" error is "NotNumber_error"
    Then clear "טלפון נייד" field

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


  Scenario Outline: phone extra check valid
    Given I navigate to "DogHoldingLic" page
    When I write "<text>" in "טלפון נוסף:"
    Then field "טלפון נוסף:" has valid value
    And  check if "טלפון נוסף:" error is "NotNumber_error"
    Then clear "טלפון נוסף:" field
    Examples:
      | text    |
      | 1212131 |
      | 4075877 |
      | 3333333 |

      #BUG : field take the all
  Scenario Outline: phone extra check invalid
    Given I navigate to "DogHoldingLic" page
    When I write "<text>" in "טלפון נוסף:"
    Then field "טלפון נוסף:" has inValid value
    And  check if "טלפון נוסף:" error is "NotNumber_error"
    Then clear "טלפון נוסף:" field

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
    Given I navigate to "DogHoldingLic" page
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
    Given I navigate to "DogHoldingLic" page
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


  Scenario Outline: datebirth valid check
    Given I navigate to "DogHoldingLic" page
    When I scroll to value "<text>" and "שנת לידה:"
    Then field "שנת לידה:" has valid value
    And  check if "שנת לידה:" in jerusalem
    And  check if "שנת לידה:" error is "wrong_select"
    Then clear "שנת לידה:" field
    Examples:
      | text |
      | 2007 |
      | 2006 |
      | 2005 |
      | 1989 |
      | 2001 |
      | 1976 |

  Scenario Outline: datebirth invalid check
    Given I navigate to "DogHoldingLic" page
    When I scroll to value "<text>" and "שנת לידה:"
    Then field "שנת לידה:" has inValid value
    And  check if "שנת לידה:" in jerusalem
    And  check if "שנת לידה:" error is "wrong_select"
    Then clear "שנת לידה:" field
    Examples:
      | text |
      | 1    |
      | 11   |
      | 12   |
      | 24   |
      | dsad |


  Scenario Outline: chack all the fields
    Given I navigate to "DogHoldingLic" page
    When check the explanation tittle
    And check the explanation body
    When I choice value "<idType>" in "identityType"
    And I write "<id>" in "מספר ת.ז."
    And I write "<fname>" in "שם פרטי"
    And I write "<lname>" in "שם משפחה"
    Then check the city is "ירושלים"
    And I write "<streer>" in "רחוב"
    And I write "<home>" in "מספר בית"
    When I write "<email>" in "אימייל:"
    And I picked value "<3num>" and "טלפון נייד"
    And I write "<phone>" in "טלפון נייד"
    When I click on "next" button
    Examples:
      | idType | id        | fname | lname | email   | streer | home | 3num | phone   |
      |        |           |       |       |         |        |      |      |         |
      | דרכון  | 111111100 | ווסאם | עוקה  | w@w.com | א טברי |      | 052  |         |
      | ת.ז.   | 111111100 | ווסאם | עוקה  | w@w.com |        |      |      | 4075877 |
      | דרכון  | 111111100 | ווסאם | עוקה  |         |        |      | 052  | 4075877 |
      | ת.ז.   | 111111100 | ווסאם |       | w@w.com |        |      | 052  | 4075877 |
      | דרכון  | 111111100 |       | עוקה  | w@w.com |        |      | 052  | 4075877 |
      | ת.ז.   |           | ווסאם | עוקה  | w@w.com |        |      | 052  | 4075877 |
      |        | 111111100 | ווסאם | עוקה  | w@w.com |        |      | 052  | 4075877 |



  Scenario : save form
    Given I navigate to "DogHoldingLic" page
    When I click on header "שמור" button
    And save all input field values
    Then check "massage" and "date" saved form
    When click ok massage alert
    Then check page step
    And check all input field values


  Scenario : print page
    Given I navigate to "DogHoldingLic" page
    When I click on header "הדפס" button
    Then check preview page
    When click "action"
