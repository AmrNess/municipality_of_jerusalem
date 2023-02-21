Feature: Test for TransferDogOwnership Form Page with no licence dog
  - Feature file name:TransferDogOwnership_page2_YesLicence.feature
  - Form link: https://jeronlineforms.jerusalem.muni.il/TransferDogOwnership
  - Number of Pages is : 3, We are at Page: 2 [no]
  - The licence choice has two options, [Yes] or [No], we should choose one of them to
  be able to fill the form, each option has different fields.
  - In this page we will check all the fields that appear to us after pressing [no] Button

  Scenario: check form explanation
    Given I navigate to "TransferDogOwnership" page
    Then check the explanation tittle
    And check the explanation body


#BUG: TAKE THE ALL LANGUAGE AND NUMBERS
  Scenario Outline: doge name check valid
    #check with valed names
    Given I navigate to "TransferDogOwnership" page
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
    Given I navigate to "TransferDogOwnership" page
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
    Given I navigate to "TransferDogOwnership" page
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
    Given I navigate to "TransferDogOwnership" page
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
    Given I navigate to "TransferDogOwnership" page
    When I choice value "<text>" in "מין"
    Then validate "מין" the chosen option is valid
    And check if "<text>" active
    Examples:
      | text |
      | זכר  |
      | נקבה |

  Scenario Outline: choice sex dog invalid
    Given I navigate to "TransferDogOwnership" page
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
    Given I navigate to "TransferDogOwnership" page
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
    Given I navigate to "TransferDogOwnership" page
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
    Given I navigate to "TransferDogOwnership" page
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
    Given I navigate to "TransferDogOwnership" page
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
    Given I navigate to "TransferDogOwnership" page
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
    Given I navigate to "TransferDogOwnership" page
    When I picked value "<text>" and "dogBirthYear"
    And  check if "dogBirthYear" error is "wrong_choice"
    Then clear "dogBirthYear" field
    Examples:
      | text |
      | 02   |
      | 001  |
      | 123  |


  Scenario Outline: choice sterilized dog valid
    Given I navigate to "TransferDogOwnership" page
    When I choice value "<text>" in "הכלב מחוסן כנגד מחלת הכלבת?"
    Then validate "הכלב מחוסן כנגד מחלת הכלבת?" the chosen option is valid
    And check if "<text>" active
    Examples:
      | text |
      | כן   |
      | לא   |

  Scenario Outline: choice sterilized dog invalid
    Given I navigate to "TransferDogOwnership" page
    When I choice value "<text>" in "הכלב מחוסן כנגד מחלת הכלבת?"
    Then validate "הכלב מחוסן כנגד מחלת הכלבת?" the chosen option is inValid
    And check if "<text>" active
    Examples:
      | text |
      | dd   |
      | דג   |


  Scenario Outline: Date Rabies Vaccine with valid values
    #to get that we most to choice is Rabies Vaccine dog yes
    Given Navigate to "TransferDogOwnership" Page
    When I choice value "כן" in "הכלב מחוסן כנגד מחלת הכלבת?"
    When Click on "הכלב מחוסן כנגד מחלת הכלבת?" field
    And Clear "הכלב מחוסן כנגד מחלת הכלבת?" field
    When Fill "הכלב מחוסן כנגד מחלת הכלבת?" field with "<Date>"
    Then Validate if "הכלב מחוסן כנגד מחלת הכלבת?" field has valid value
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


  Scenario Outline: address valid check
    Given I navigate to "TransferDogOwnership" page
    When I scroll to value "<text>" and "הכלב רשום ברשות המקומית:"
    Then field "הכלב רשום ברשות המקומית:" has valid value
    And  check if "הכלב רשום ברשות המקומית:" in jerusalem
    And  check if "הכלב רשום ברשות המקומית:" error is "wrong_select"
    Then clear "הכלב רשום ברשות המקומית:" field
    Examples:
      | text   |
      | א טברי |
      | החוצה  |
      | הטורים |

  Scenario Outline: address invalid check
    Given I navigate to "TransferDogOwnership" page
    When I scroll to value "<text>" and "הכלב רשום ברשות המקומית:"
    Then field "הכלב רשום ברשות המקומית:" has inValid value
    And  check if "הכלב רשום ברשות המקומית:" in jerusalem
    And  check if "הכלב רשום ברשות המקומית:" error is "wrong_select"
    Then clear "הכלב רשום ברשות המקומית:" field
    Examples:
      | text |
      | 1    |
      | 11   |
      | 12   |
      | 24   |


  Scenario Outline: Delivery Date with valid values
    Given Navigate to "TransferDogOwnership" Page
    When Click on "תאריך מסירת הכלב:" field
    And Clear "תאריך מסירת הכלב:" field
    And Fill "תאריך מסירת הכלב:" field  with "<Date>"
    Then Validate if "תאריך מסירת הכלב:" field  has valid value
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


  Scenario Outline: chack all the fields
    Given I navigate to "TransferDogOwnership" page
    When check the explanation tittle
    And check the explanation body
    When I write "<name>" in "שם הכלב"
    And I write "<type>" in "גזע"
    And I choice value "<sex>" in "מין"
    And I write "<color>" in "v"
    And I write "<chipNumber>" in "מספר שבב"
    And I picked value "<year>" and "שנת לידה:"
    And I choice value "<sterilize>" in "מעוקר / מסורס"
    And Fill "תאריך מסירת הכלב:" field  with "<DateSterilize>"
    And I click on "next" button
    Then check if alert label is enabled "<label>"
    Examples:
      | label             | name | type | sex | color | chipNumber | year | sterilize | DateSterilize |
      | שם הכלב           |      |      |     |       |            |      |           |               |
      | גזע               |      |      |     |       |            |      |           |               |
      | מין               |      |      |     |       |            |      |           |               |
      | צבע               |      |      |     |       |            |      |           |               |
      | מספר שבב          |      |      |     |       |            |      |           |               |
      | שנת לידה:         |      |      |     |       |            |      |           |               |
      | מעוקר / מסורס     |      |      |     |       |            |      |           |               |
      | תאריך מסירת הכלב: |      |      |     |       |            |      |           |               |

#      |       | רוי  | וולף | זכר  | שחור  | 1234567891 | 2009 | כן       | 12/12/1988   |
#      |       | רוי  | וולף | נקבה | שחור  | 1234567891 | 2009 | כן       | 12/12/1988   |
#      |       | רוי  | וולף | זכר  | שחור  | 1234567891 | 2009 | לא       | 12/12/1988   |
#      |       | רוי  | וולף | נקבה | שחור  | 1234567891 | 2009 | לא       | 12/12/1988   |
#      |       | רוי  | וולף | נקבה | שחור  | 1234567891 | 2009 | לא       | 12/12/1988   |
#      |       | רוי  | וולף | נקבה | שחור  | 1234567891 | 2009 | לא       |              |
#      |       | רוי  | וולף | נקבה | שחור  | 1234567891 | 2009 |          | 12/12/1988   |
#      |       | רוי  | וולף | נקבה | שחור  | 1234567891 |      | לא       | 12/12/1988   |
#      |       | רוי  | וולף | נקבה | שחור  |            | 2009 | לא       | 12/12/1988   |
#      |       | רוי  | וולף | נקבה |       | 1234567891 | 2009 | לא       | 12/12/1988   |
#      |       | רוי  | וולף |      | שחור  | 1234567891 | 2009 | לא       | 12/12/1988   |
#      |       | רוי  |      | נקבה | שחור  | 1234567891 | 2009 | לא       | 12/12/1988   |
#      |       |      | וולף | נקבה | שחור  | 1234567891 | 2009 | לא       | 12/12/1988   |





  Scenario : save form
    Given I navigate to "TransferDogOwnership" page
    When I click on header "שמור" button
    And save all input field values
    And save page step
    Then check "massage" and "date" saved form
    When click ok massage alert
    Then check page step
    And check all input field values


  Scenario : print page
    Given I navigate to "TransferDogOwnership" page
    When I click on header "הדפס" button
    Then check preview page
    When click "action"

