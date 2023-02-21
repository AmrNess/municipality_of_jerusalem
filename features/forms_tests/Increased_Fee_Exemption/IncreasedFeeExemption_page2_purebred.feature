Feature: Test for IncreasedFeeExemption Form Page
  - Feature file name:IncreasedFeeExemption_page2_medicalCondition.feature
  - Form link: https://jeronlineforms.jerusalem.muni.il/IncreasedFeeExemption
  - Number of Pages is : 3, We are at Page: 2 [purebred]
  - The licence choice has three options, [Age Dog] or [medical condition] or [purebred], we should choose one of them to
  be able to fill the form, each option has different fields.
  - In this page we will check all the fields that appear to us after pressing [purebred] Choice


  Scenario: chack all the fields
    Given I navigate to "IncreasedFeeExemption" page
    When I write "ee" in "שם הכלב"
    And I write "ee" in "גזע"
    And I choice value "זכר" in "מין"
    And I write "ww" in "צבע"
    And I write "1234567891" in "מספר שבב"
    And I picked value "2001" and "שנת לידה:"
    And I choice value "פטור עקב היות הכלב כלב טהור גזע" in "סיבת הפטור"


  Scenario Outline: check most field input
    Given I navigate to "IncreasedFeeExemption" page
    When I click on "המשך" button
    Then check if "<text>" error is "Mandatory_to_fill"
    Examples:
      | text                                         |
      | שם הכלב הרשום בתעודת היוחסין                 |
      | מספר סגי"ר כפי שמופיע בתעודת היוחסין של הכלב |
      | בעל הכלב הרשום בתעודת ההי"ל                  |




  #BUG: name take infinity character
  Scenario Outline: dog name check valid
    #check with valed names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "שם הכלב הרשום בתעודת היוחסין"
    Then field "שם הכלב הרשום בתעודת היוחסין" has valid value
    And  check if "שם הכלב הרשום בתעודת היוחסין" error is "language_error"
    And clear "שם הכלב הרשום בתעודת היוחסין" field
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
  Scenario Outline: dog name check invalid
    #check with invaled names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "שם הכלב הרשום בתעודת היוחסין"
    Then field "שם הכלב הרשום בתעודת היוחסין" has inValid value
    And  check if "שם הכלב הרשום בתעודת היוחסין" error is "language_error"
    Then clear "שם הכלב הרשום בתעודת היוחסין" field
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



  #BUG: name take infinity character and all the type of character
  Scenario Outline: name clinic check valid
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in 'מספר סגי"ר כפי שמופיע בתעודת היוחסין של הכלב'
    Then field 'מספר סגי"ר כפי שמופיע בתעודת היוחסין של הכלב' has valid value
    And  check if 'מספר סגי"ר כפי שמופיע בתעודת היוחסין של הכלב' error is "language_error"
    And clear 'מספר סגי"ר כפי שמופיע בתעודת היוחסין של הכלב' field
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
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in 'מספר סגי"ר כפי שמופיע בתעודת היוחסין של הכלב'
    Then field 'מספר סגי"ר כפי שמופיע בתעודת היוחסין של הכלב' has inValid value
    And  check if 'מספר סגי"ר כפי שמופיע בתעודת היוחסין של הכלב' error is "language_error"
    Then clear 'מספר סגי"ר כפי שמופיע בתעודת היוחסין של הכלב' field
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
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in 'בעל הכלב הרשום בתעודת ההי"ל'
    Then field 'בעל הכלב הרשום בתעודת ההי"ל' has valid value
    And  check if 'בעל הכלב הרשום בתעודת ההי"ל' error is "language_error"
    And clear 'בעל הכלב הרשום בתעודת ההי"ל' field
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
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in 'בעל הכלב הרשום בתעודת ההי"ל'
    Then field 'בעל הכלב הרשום בתעודת ההי"ל' has inValid value
    And  check if 'בעל הכלב הרשום בתעודת ההי"ל' error is "language_error"
    Then clear 'בעל הכלב הרשום בתעודת ההי"ל' field
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


  Scenario Outline: request Reason Select check Valid
    Given I navigate to "IncreasedFeeExemption" page
    When I scroll to value "<text>" in "הנימוק לבקשה"
    And  check if "הנימוק לבקשה" error is "wrong_choice"
    Then clear "הנימוק לבקשה" field

    Examples:
      | text                |
      | הכלב הינו כלב רביה  |
      | הכלב משתתף בתערוכות |
      | אחר                 |



  """ other selecred """

  Scenario Outline: check most field input
    Given I navigate to "IncreasedFeeExemption" page
    When I write "ee" in "שם הכלב"
    And I write "ee" in "גזע"
    And I choice value "זכר" in "מין"
    And I write "ww" in "צבע"
    And I write "1234567891" in "מספר שבב"
    And I picked value "2001" and "שנת לידה:"
    And I choice value "פטור עקב היות הכלב כלב טהור גזע" in "סיבת הפטור"
    And I choice value "אחר" in "הנימוק לבקשה"
    When I click on "המשך" button
    Then check if "<text>" error is "Mandatory_to_fill"
    Examples:
      | text                                         |
      | שם הכלב הרשום בתעודת היוחסין                 |
      | מספר סגי"ר כפי שמופיע בתעודת היוחסין של הכלב |
      | בעל הכלב הרשום בתעודת ההי"ל                  |
      | פירוט                                        |




     #BUG: name take infinity character
  Scenario Outline: request Reason Details check valid
    Given I navigate to "IncreasedFeeExemption" page
    When I choice value "פטור עקב היות הכלב כלב טהור גזע" in "סיבת הפטור"
    And I choice value "אחר" in "הנימוק לבקשה"
    When I write "<text>" in "פירוט"
    Then field "פירוט" has valid value
    And  check if "פירוט" error is "language_error"
    And clear "פירוט" field
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
  Scenario Outline: request Reason Detailsפירוט check invalid
    Given I navigate to "IncreasedFeeExemption" page
    When I choice value "פטור עקב היות הכלב כלב טהור גזע" in "סיבת הפטור"
    And I choice value "אחר" in "הנימוק לבקשה"
    When I write "<text>" in "פירוט"
    Then field "פירוט" has inValid value
    And  check if "פירוט" error is "language_error"
    Then clear "פירוט" field
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

