Feature: Test for IncreasedFeeExemption Form Page
  - Feature file name:IncreasedFeeExemption_page2_medicalCondition.feature
  - Form link: https://jeronlineforms.jerusalem.muni.il/IncreasedFeeExemption
  - Number of Pages is : 3, We are at Page: 2 [medical condition]
  - The licence choice has three options, [Age Dog] or [medical condition] or [purebred], we should choose one of them to
  be able to fill the form, each option has different fields.
  - In this page we will check all the fields that appear to us after pressing [medical condition] Choice


  Scenario: chack all the fields
    Given I navigate to "IncreasedFeeExemption" page
    When I write "ee" in "שם הכלב"
    And I write "ee" in "גזע"
    And I choice value "זכר" in "מין"
    And I write "ww" in "צבע"
    And I write "1234567891" in "מספר שבב"
    And I picked value "2001" and "שנת לידה:"
    And I choice value "פטור עקב מצב רפואי" in "סיבת הפטור"
    And I write "eeeeeeeeeeeee" in "הנימוק לבקשה"


  Scenario Outline: check most field input
    Given I navigate to "IncreasedFeeExemption" page
    When I click on "next" button
    Then check if "<text>" error is "Mandatory_to_fill"
    Examples:
      | text                 |
      | שם                   |
      | מספר טלפון           |
      | שם המרפאה הווטרינרית |
      | כתובת:               |




  #BUG: name take infinity character
  Scenario Outline: name check valid
    #check with valed names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "שם"
    Then field "שם" has valid value
    And  check if "שם" error is "language_error"
    And clear "שם" field
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
  Scenario Outline: name check invalid
    #check with invaled names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "שם"
    Then field "שם" has inValid value
    And  check if "שם" error is "language_error"
    Then clear "שם" field
    Examples:
      | text              |
      #Bug
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


  Scenario Outline: phone number check valid
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "מספר טלפון"
    Then field "מספר טלפון" has valid value
    And  check if "מספר טלפון" error is "ספרות בלבד"
    Then clear "מספר טלפון" field
    Examples:
      | text    |
      | 1212131 |
      | 4075877 |
      | 3333333 |

  Scenario Outline: phone number check invalid
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "מספר טלפון"
    Then field "מספר טלפון" has inValid value
    And  check if "מספר טלפון" error is "ספרות בלבד"
    Then clear "מספר טלפון" field

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


  Scenario Outline: extra phone number check valid
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "טלפון נוסף:"
    Then field "טלפון נוסף:" has valid value
    And  check if "טלפון נוסף:" error is "ספרות בלבד"
    Then clear "טלפון נוסף:" field
    Examples:
      | text    |
      | 1212131 |
      | 4075877 |
      | 3333333 |

  Scenario Outline: extra phone number check invalid
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "טלפון נוסף:"
    Then field "טלפון נוסף:" has inValid value
    And  check if "טלפון נוסף:" error is "ספרות בלבד"
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



  #BUG: name take infinity character
  Scenario Outline: name clinic check valid
    #check with valed clinic names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "שם המרפאה הווטרינרית"
    Then field "שם המרפאה הווטרינרית" has valid value
    And  check if "שם המרפאה הווטרינרית" error is "language_error"
    And clear "שם המרפאה הווטרינרית" field
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
  Scenario Outline: name clinic check invalid
    #check with invaled clinic names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "שם המרפאה הווטרינרית"
    Then field "שם המרפאה הווטרינרית" has inValid value
    And  check if "שם המרפאה הווטרינרית" error is "language_error"
    Then clear "שם המרפאה הווטרינרית" field
    Examples:
      | text              |
      #Bug
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



     #BUG: name take infinity character
  Scenario Outline: address check valid
    #check with valed address
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "כתובת:"
    Then field "כתובת:" has valid value
    And  check if "כתובת:" error is "language_error"
    And clear "כתובת:" field
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
  Scenario Outline: address check invalid
    #check with invaled address
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "כתובת:"
    Then field "כתובת:" has inValid value
    And  check if "כתובת:" error is "language_error"
    Then clear "כתובת:" field
    Examples:
      | text              |
      #Bug
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


