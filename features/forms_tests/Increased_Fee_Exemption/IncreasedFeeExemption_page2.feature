Feature: Test for IncreasedFeeExemption Form Page


  Scenario: check form explanation
    Given I navigate to "IncreasedFeeExemption" page
    Then check the explanation tittle
    And check the explanation body



#BUG: TAKE THE ALL LANGUAGE AND NUMBERS
  Scenario Outline: doge name check valid
    #check with valed names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "שם הכלב"
    Then field "שם הכלב" has valid value
    And  check if "שם הכלב" error is "language_error"
    And clear "שם הכלב" field
    Examples:
      | text        |
      | יחלךףחיס    |
      | .יחלךףחיס   |
      | יחלךףחיס\   |
      | יחלךףחיס()- |
      | יחלךףחיס_   |
      | יחלךףחיס,   |
      | יחלךףחיס    |


    #BUG: TAKE THE ALL LANGUAGE AND NUMBERS
  Scenario Outline: doge name check InValid
    #check with valed names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "שם הכלב"
    Then field "שם הכלב" has InValid value
    And  check if "שם הכלב" error is "language_error"
    And clear "שם הכלב" field
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
      | dfsafsa           |




    #BUG: TAKE THE ALL LANGUAGE AND NUMBERS
  Scenario Outline: doge type check valid
    #check with valed names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "גזע"
    Then field "גזע" has valid value
    And  check if "גזע" error is "language_error"
    And clear "גזע" field
    Examples:
      | text        |
      | יחלךףחיס    |
      | .יחלךףחיס   |
      | יחלךףחיס\   |
      | יחלךףחיס()- |
      | יחלךףחיס_   |
      | יחלךףחיס,   |
      | יחלךףחיס    |


    #BUG: TAKE THE ALL LANGUAGE AND NUMBERS
  Scenario Outline: doge type check InValid
    #check with valed names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "גזע"
    Then field "גזע" has InValid value
    And  check if "גזע" error is "language_error"
    And clear "גזע" field
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
      | dfsafsa           |


  Scenario Outline: choice sex dog valid
    Given I navigate to "IncreasedFeeExemption" page
    When I choice value "<text>" in "מין"
    Then validate "מין" the chosen option is valid
    And check if "<text>" active
    Examples:
      | text |
      | זכר  |
      | נקבה |

  Scenario Outline: choice sex dog invalid
    Given I navigate to "IncreasedFeeExemption" page
    When I choice value "<text>" in "מין"
    Then validate "מין" the chosen option is inValid
    And check if "<text>" active
    Examples:
      | text |
      | dd   |
      | דג   |




        #BUG: TAKE THE ALL LANGUAGE AND NUMBERS
  Scenario Outline: doge color check valid
    #check with valed names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "צבע"
    Then field "צבע" has valid value
    And  check if "צבע" error is "language_error"
    And clear "צבע" field
    Examples:
      | text        |
      | יחלךףחיס    |
      | .יחלךףחיס   |
      | יחלךףחיס\   |
      | יחלךףחיס()- |
      | יחלךףחיס_   |
      | יחלךףחיס,   |
      | יחלךףחיס    |


    #BUG: TAKE THE ALL LANGUAGE AND NUMBERS
  Scenario Outline: doge color check InValid
    #check with valed names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "צבע"
    Then field "צבע" has InValid value
    And  check if "צבע" error is "language_error"
    And clear "צבע" field
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
      | dfsafsa           |


  Scenario Outline: Chip number dog valid
     # check id field with invalid values
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<id>" in "מספר שבב"
    Then field "מספר שבב" has Valid value
    And  check if "מספר שבב" error is "less10Digits_error"
    And  check if "מספר שבב" error is "language_error"
          """just take english and numbers """
    Examples:
      | id           |
      | 000000000    |
      | 123456789123 |
      | wiwiwiwiwi   |

  Scenario Outline: Chip number dog invalid
     # check id field with invalid values
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<id>" in "מספר שבב"
    Then field "מספר שבב" has InValid value
    And  check if "מספר שבב" error is "less10Digits_error"
    And  check if "מספר שבב" error is "language_error"
          """just take english and numbers """
    Examples:
      | id                       |
      | 0000000                  |
      | 123456789123111111111111 |
      | wiwiwiwiwiwwwwwwwwwww    |
      | q                        |
      | דגגגדדדדדדדדדדדדדד       |
      | דגגג                     |
      | سسيسيسي                  |

  Scenario Outline: dog Birth Year selector check Valid
    Given I navigate to "IncreasedFeeExemption" page
    When I picked value "<text>" and "dogBirthYear"
    And  check if "dogBirthYear" error is "wrong_choice"
    Then clear "dogBirthYear" field

    Examples:
      | text |
      | 2023 |
      | 2022 |
      | 2021 |
      | 2020 |
      | 2019 |
      | 2018 |
      | 2017 |
      | 2016 |
      | 2015 |
      | 2014 |
      | 2013 |
      | 2012 |
      | 2011 |
      | 2010 |
      | 2009 |
      | 2008 |
      | 2007 |
      | 2006 |
      | 2005 |
      | 2004 |
      | 2003 |
      | 2002 |
      | 2001 |
      | 2000 |
      | 1999 |
      | 1998 |
      | 1997 |
      | 1996 |
      | 1995 |
      | 1994 |


  Scenario Outline: dog Birth Year selector check inValid
    Given I navigate to "IncreasedFeeExemption" page
    When I picked value "<text>" and "dogBirthYear"
    And  check if "dogBirthYear" error is "wrong_choice"
    Then clear "dogBirthYear" field
    Examples:
      | text |
      | 02   |
      | 001  |
      | 123  |


  Scenario Outline: exemption Reason selector check Valid
    Given I navigate to "IncreasedFeeExemption" page
    When I scroll to value "<text>" in "סיבת הפטור"
    And  check if "סיבת הפטור" error is "wrong_choice"
    Then clear "סיבת הפטור" field

    Examples:
      | text                            |
      | פטור עקב גיל הכלב               |
      | פטור עקב מצב רפואי              |
      | פטור עקב היות הכלב כלב טהור גזע |


  Scenario Outline: exemption Reason selector check inValid
    Given I navigate to "IncreasedFeeExemption" page
    When I scroll to value "<text>" in "סיבת הפטור"
    And  check if "סיבת הפטור" error is "wrong_choice"
    Then clear "סיבת הפטור" field
    Examples:
      | text |
      |      |
      | ssss |


  Scenario Outline: reason Request check
    #check with valed names
    Given I navigate to "IncreasedFeeExemption" page
    When I write "<text>" in "הנימוק לבקשה"
    Then field "הנימוק לבקשה" has valid value
    And  check if "הנימוק לבקשה" error is "חובה למלא את הנימוק לבקשה"
    And clear "הנימוק לבקשה" field
    Examples:
      | text        |
      | יחלךףחיס    |
      | .יחלךףחיס   |
      | יחלךףחיס\   |
      | יחלךףחיס()- |
      | יחלךףחיס_   |
      | יחלךףחיס,   |
      | יחלךףחיס    |


#  Scenario Outline: chack all the fields
#    Given I navigate to "IncreasedFeeExemption" page
#    When check the explanation tittle
#    And check the explanation body
#    When I write "<name>" in "שם הכלב"
#    And I write "<type>" in "גזע"
#    And I choice value "<sex>" in "מין"
#    And I write "<color>" in "צבע"
#    And I write "<chipNumber>" in "מספר שבב"
#    And I picked value "<year>" and "שנת לידה:"
#    And I choice value "<steriliz>" in "מעוקר / מסורס"
#    And I choice value "<guide>" in "כלב נחיה"
#    Then I click on "next" button
#    Examples:
#      | name | type | sex  | color | chipNumber | year | steriliz | guide |
#      |      |      |      |       |            |      |          |       |
#      | רוי  | וולף | זכר  | שחור  | 1234567891 | 2009 | כן       | כן    |
#      | רוי  | וולף | נקבה | שחור  | 1234567891 | 2009 | כן       | לא    |
#      | רוי  | וולף | זכר  | שחור  | 1234567891 | 2009 | לא       | כן    |
#      | רוי  | וולף | נקבה | שחור  | 1234567891 | 2009 | לא       | לא    |
#      | רוי  | וולף | נקבה | שחור  | 1234567891 | 2009 | לא       |       |
#      | רוי  | וולף | נקבה | שחור  | 1234567891 | 2009 |          | לא    |
#      | רוי  | וולף | נקבה | שחור  | 1234567891 |      | לא       | לא    |
#      | רוי  | וולף | נקבה | שחור  |            | 2009 | לא       | לא    |
#      | רוי  | וולף | נקבה |       | 1234567891 | 2009 | לא       | לא    |
#      | רוי  | וולף |      | שחור  | 1234567891 | 2009 | לא       | לא    |
#      | רוי  |      | נקבה | שחור  | 1234567891 | 2009 | לא       | לא    |
#      |      | וולף | נקבה | שחור  | 1234567891 | 2009 | לא       | לא    |
#




  Scenario : save form
    Given I navigate to "IncreasedFeeExemption" page
    When I click on header "שמור" button
    And save all input field values
    And save page step
    Then check "massage" and "date" saved form
    When click ok massage alert
    Then check page step
    And check all input field values


  Scenario : print page
    Given I navigate to "IncreasedFeeExemption" page
    When I click on header "הדפס" button
    Then check preview page
    When click "action"

