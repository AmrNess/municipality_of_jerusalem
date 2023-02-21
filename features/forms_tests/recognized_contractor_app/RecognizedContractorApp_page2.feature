Feature: Test for RecognizedContractorApp Form Page

  Scenario: check form explanation
    Given I navigate to "RecognizedContractorApp" page
    Then check the explanation tittle
    And check the explanation body


  Scenario: 2nd step RecognizedContractorApp
    #fill first step to go to the next step
    Given I navigate to "RecognizedContractorApp" page
    When check the explanation tittle
    And check the explanation body
    And I write "1111111" in "מספר ת.ז."
    And I write "ווסאם" in "שם פרטי"
    And I write "עוקה" in "שם משפחה"
    And I write "w@w.com" in "דוא"ל"
    And I picked value "052" and "טלפון נייד"
    And I write "4075877" in "טלפון נייד"
    Then I click on "next" button


  Scenario Outline: Name of contractor valid
    #check with valed names
    Given I navigate to "RecognizedContractorApp" page
    When I write "<text>" in "שם קבלן/ ספק:"
    Then field "שם קבלן/ ספק:" has valid value
    And  check if "שם קבלן/ ספק:" error is "language_error"
    And clear "שם קבלן/ ספק:" field
    Examples:
      | text        |
      | מושי        |
      | יחלךףחיס    |
      | .יחלךףחיס   |
      | יחלךףחיס\   |
      | יחלךףחיס()- |
      | יחלךףחיס_   |
      | יחלךףחיס,   |
      | יחלךףחיס    |

    #BUG: this field take the all
  Scenario Outline: Name of contractor invalid
    #check with invaled names
    Given I navigate to "RecognizedContractorApp" page
    When I write "<text>" in "שם קבלן/ ספק:"
    Then field "שם קבלן/ ספק:" has inValid value
    And  check if "שם קבלן/ ספק:" error is "language_error"
    And clear "שם קבלן/ ספק:" field
    Examples:
      | text              |
      #BUG:
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

  Scenario Outline: radio choice identityType valid
    Given I navigate to "RecognizedContractorApp" page
    When I choice value "<text>" in "identityType"
    Then validate "identityType" the chosen option is valid
    And check if "<text>" active
    Examples:
      | text |
      | מ''ז |
      | ח''פ |
      | ע''מ |
      | ע''ר |

  Scenario Outline: radio choice identityType invalid
    Given I navigate to "RecognizedContractorApp" page
    When I choice value "<text>" in "identityType"
    Then validate "identityType" the chosen option is inValid
    And check if "<text>" active
    Examples:
      | text |
      | dd   |
      | דג   |

    #BUG: this field take the all
  Scenario Outline: identity number character
    # check character in field
    Given I navigate to "RecognizedContractorApp" page
    When I write "<id>" in "contractorId"
    Then field "contractorId" has valid value
    And  check if ""contractorId" error is "מספר זהות שגוי"
    Then clear "contractorId" field
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

  Scenario Outline: identity number number
    # check number in field
    Given I navigate to "RecognizedContractorApp" page
    When I write "<id>" in "contractorId"
    Then field "contractorId" has inValid value
    And  check if ""contractorId" error is "מספר זהות שגוי"
    Then clear "contractorId" field
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


  Scenario Outline: signature
    Given I navigate to "RecognizedContractorApp" page
    When I write "<text>" in " תחומי התמחות:"
    Then field " תחומי התמחות:" has valid value
    When clear " תחומי התמחות:" field
    Examples:
      | text              |
      | ווסאם             |
      | asdasd            |
      | ווסאם             |
      | asdasd            |
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


  Scenario Outline: address invalid
    #check invalid address
    Given I navigate to "RecognizedContractorApp" page
    Then clear " תחומי התמחות:" field
    When I write "<text>" in " כתובת:"
    Then field " כתובת:" has inValid value
    Examples:
      | text              |
      | jerusalem         |
      | القدس             |
      | asdasd            |
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

  Scenario Outline: address valid
    #check valid address
    Given I navigate to "RecognizedContractorApp" page
    When I write "<text>" in " כתובת:"
    Then field " כתובת:" has Valid value
    Examples:
      | text    |
      | ירושלים |
      | גכע     |
      | קראטון  |


  Scenario Outline: phone examples check valid
    Given I navigate to "RecognizedContractorApp" page
    When I write "<text>" in " טלפון במשרד:"
    Then field " טלפון במשרד:" has valid value
    And  check if " טלפון במשרד:" error is "NotNumber_error"
    Then clear " טלפון במשרד:" field
    Examples:
      | text    |
      | 1212131 |
      | 4075877 |
      | 3333333 |


    #BUG : this field take the all
  Scenario Outline: phone examples check invalid
    Given I navigate to "RecognizedContractorApp" page
    When I write "<text>" in " טלפון במשרד:"
    Then field " טלפון במשרד:" has inValid value
    And  check if " טלפון במשרד:" error is "NotNumber_error"
    Then clear " טלפון במשרד:" field
    Examples:
      | text        |
      #BUG:
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
    #fill second step to go to the next step
    Given I navigate to "RecognizedContractorApp" page
    When I write "<fname>" in "שם קבלן/ ספק:"
    And I choice value "<idType>" in "identityType"
    And I write "<id>" in "contractorId"
    And I write "<singtchre>" in " תחומי התמחות:"
    And I write "<address>" in "כתובת:"
    And I write "<phone>" in "טלפון במשרד:"
    Then I click on "next" button
    Examples:
      | fname | idType | id        | singtchre | address | phone   |
      |       |        |           |           |         |         |
      | ווסאם | מ''ז   | 111111100 | קקקקק     | ירושלים |         |
      | ווסאם | ח''פ   | 111111100 | קקקקק     |         | 4075877 |
      | ווסאם | ע''מ   | 111111100 |           | ירושלים | 4075877 |
      | ווסאם | ע''ר   |           | קקקקק     | ירושלים | 4075877 |
      | ווסאם |        | 111111100 | קקקקק     | ירושלים | 4075877 |
      |       | מ''ז   | 111111100 | קקקקק     | ירושלים | 4075877 |



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

