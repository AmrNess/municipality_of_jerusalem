Feature: Test for RecognizedContractorApp Form Page

  #excel 1
  Scenario: check form explanation
    Given I navigate to "RecognizedContractorApp" page
    Then check the explanation tittle
    And check the explanation body


  Scenario Outline: id check valid
    # check id field with valid values
    Given I navigate to "RecognizedContractorApp" page
    When I write "<id>" in "מספר ת.ז."
    Then field "מספר ת.ז." has Valid value
    And  check if "מספר ת.ז." error is "מספר זהות שגוי"
    Then clear "מספר ת.ז." field
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
    Given I navigate to "RecognizedContractorApp" page
    When I write "<id>" in "מספר ת.ז."
    Then field "מספר ת.ז." has inValid value
    And  check if "מספר ת.ז." error is "NotNumber_error"
    Then clear "מספר ת.ז." field
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
    Given I navigate to "RecognizedContractorApp" page
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


  Scenario Outline: first name check invalid
    #check with invaled names
    Given I navigate to "RecognizedContractorApp" page
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
    Given I navigate to "RecognizedContractorApp" page
    When I write "<text>" in "שם משפחה"
    Then field "שם משפחה" has valid value
    And  check if "שם משפחה" error is "language_error"
    Then clear "שם משפחה" field
    Examples:
      | text        |
      | ווסאם       |
      | יחלךףחיס    |
      #BUG:
      | .יחלךףחיס   |
      | יחלךףחיס\   |
      | יחלךףחיס()- |
      | יחלךףחיס_   |
      | יחלךףחיס,   |
      | יחלךףחיס    |

  Scenario Outline: last name check invalid
    #check with invaled names
    Given I navigate to "RecognizedContractorApp" page
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


  Scenario Outline: email check valid
    #check with valed emails
    Given I navigate to "RecognizedContractorApp" page
    When I write "<email>" in 'דוא"ל'
    Then field 'דוא"ל' has valid value
    And  check if 'דוא"ל' error is "email_error"
    Then clear 'דוא"ל' field
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


  Scenario Outline: emails check invalid
    #check with invaled emails
    Given I navigate to "RecognizedContractorApp" page
    When I write "<text>" in 'דוא"ל'
    Then field 'דוא"ל' has inValid value
    And  check if 'דוא"ל' error is "email_error"
    Then clear 'דוא"ל' field

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


  Scenario Outline: phone three number check valid
    Given I navigate to "RecognizedContractorApp" page
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
    Given I navigate to "RecognizedContractorApp" page
    When I picked value "<text>" and "dropDownPhone"
    And  check if "dropDownPhone" error is "wrong_choice"
    Then clear "dropDownPhone" field
    Examples:
      | text |
      | 02   |
      | 001  |
      | 123  |


  Scenario Outline: phone number check valid
    Given I navigate to "RecognizedContractorApp" page
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
    Given I navigate to "RecognizedContractorApp" page
    When I write "<text>" in "טלפון נייד"
    Then field "טלפון נייד" has inValid value
    And  check if "טלפון נייד" error is "NotNumber_error"
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

  Scenario Outline: chack all the fields
    Given I navigate to "DogHoldingLic" page
    When check the explanation tittle
    And check the explanation body
    When I write "<id>" in "מספר ת.ז."
    And I write "<fname>" in "שם פרטי"
    And I write "<lname>" in "שם משפחה"
    And I write "<email>" in "דוא"ל"
    And I picked value "<3num>" and "טלפון נייד"
    And I write "<phone>" in "טלפון נייד"
    Then I click on "next" button
    Examples:
      | id        | fname | lname | email   | 3num | phone   |
      |           |       |       |         |      |         |
      | 111111100 | ווסאם | עוקה  | w@w.com | 052  |         |
      | 111111100 | ווסאם | עוקה  | w@w.com |      | 4075877 |
      | 111111100 | ווסאם | עוקה  |         | 052  | 4075877 |
      | 111111100 | ווסאם |       | w@w.com | 052  | 4075877 |
      | 111111100 |       | עוקה  | w@w.com | 052  | 4075877 |
      |           | ווסאם | עוקה  | w@w.com | 052  | 4075877 |



  Scenario : save form
    Given I navigate to "RecognizedContractorApp" page
    When I click on header "שמור" button
    And save all input field values
    And save page step
    Then check "massage" and "date" saved form
    When click ok massage alert
    Then check page step
    And check all input field values


  Scenario : print page
    Given I navigate to "RecognizedContractorApp" page
    When I click on header "הדפס" button
    Then check preview page
    When click "action"
