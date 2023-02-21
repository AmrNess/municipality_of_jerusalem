Feature: Test for DogHoldingLic Form Page with yes licence dog
  - Feature file name:DogHoldingLic_page2_YesLicence.feature
  - Form link: https://jeronlineforms.jerusalem.muni.il/DogHoldingLic
  - Number of Pages is : 3, We are at Page: 2 [yes]
  - The licence choice has two options, [Yes] or [No], we should choose one of them to
  be able to fill the form, each option has different fields.
  - In this page we will check all the fields that appear to us after pressing [YES] Button

  Scenario: check form explanation
    Given I navigate to "DogHoldingLic" page
    Then check the explanation tittle
    And check the explanation body


  Scenario Outline: radio choice yes
    Given I navigate to "DogHoldingLic" page
    When I choice value "<choice>" in "<label>"
    Then validate "<label>" the chosen option is valid
    And check if "<choice>" active
    Examples:
      | choice | label                      |
      | כן     | כלב מגזע מסוכן או הכלאותיו |
      | כן     | כלב חדש ברשות              |
      | כן     | אימוץ כלב                  |
      | כן     | שחזור רשיון                |


  Scenario Outline: radio choice no
    Given I navigate to "DogHoldingLic" page
    When I choice value "<choice>" in "<label>"
    Then validate "<label>" the chosen option is valid
    And check if "<choice>" active
    Examples:
      | choice | label                      |
      | לא     | כלב מגזע מסוכן או הכלאותיו |
      | לא     | כלב חדש ברשות              |
      | לא     | אימוץ כלב                  |
      | לא     | שחזור רשיון                |


  Scenario Outline: radio choice yes אימוץ כלב
    Given I navigate to "DogHoldingLic" page
    When I choice value "<choice>" in "<label>"
    Then validate "<label>" the chosen option is valid
    And check if "<choice>" active
    And check if "<label>" error is "לא ניתן להמשיך בטופס זה, יש למלא טופס העברת בעלות"

    Examples:
      | choice | label                      |
      | לא     | כלב מגזע מסוכן או הכלאותיו |
      | לא     | כלב חדש ברשות              |
      | כן     | אימוץ כלב                  |
      | לא     | שחזור רשיון                |



  """שחזור רשיון כן"""

  Scenario Outline:  שחזור רשיון כן
    Given I navigate to "DogHoldingLic" page
    When I choice value "<choice>" in "<label>"
    Then validate "<label>" the chosen option is valid
    And check if "<choice>" active
    And check if "<label>" error is "לא ניתן להמשיך בטופס זה, יש למלא טופס העברת בעלות"
    Examples:
      | choice | label                      |
      | לא     | כלב מגזע מסוכן או הכלאותיו |
      | לא     | כלב חדש ברשות              |
      | לא     | אימוץ כלב                  |
      | כן     | שחזור רשיון                |

  Scenario Outline: Chip number dog valid
     # check id field with invalid values
    Given I navigate to "DogHoldingLic" page
    When I write "<id>" in "מספר שבב"
    Then field "מספר שבב" has Valid value
    And  check if "מספר שבב" error is "less10Digits_error"
    And  check if "מספר שבב" error is "language_error"
          """just take english and numbers """
    Then click in "next" button
    Examples:
      | id           |
      | 000000000    |
      | 123456789123 |
      | wiwiwiwiwi   |

  Scenario Outline: Chip number dog invalid
     # check id field with invalid values
    Given I navigate to "DogHoldingLic" page
    When I write "<id>" in "מספר שבב"
    Then field "מספר שבב" has InValid value
    And  check if "מספר שבב" error is "less10Digits_error"
    And  check if "מספר שבב" error is "language_error"
          """just take english and numbers """
    Then click in "next" button
    Examples:
      | id                       |
      | 0000000                  |
      | 123456789123111111111111 |
      | wiwiwiwiwiwwwwwwwwwww    |
      | q                        |
      | דגגגדדדדדדדדדדדדדד       |
      | דגגג                     |
      | سسيسيسي                  |

  Scenario: Chip number dog invalid with empty field
     # check id field with invalid values
    Given I navigate to "DogHoldingLic" page
    When I write "" in "מספר שבב"
    Then field "מספר שבב" has InValid value
    And  check if "מספר שבב" error is "באם הכלב אינו מסומן בשבב, עליך לפנות לשירות הוטרינרי או לוטרינר פרטי על מנת לסמן את הכלב בשבב ולחסנו כנגד מחלת הכלבת"
    Then click in "next" button



  Scenario : save form
    Given I navigate to "DogHoldingLic" page
    When I click on header "שמור" button
    And save all input field values
    And save page step
    Then check "massage" and "date" saved form
    When click ok massage alert
    Then check page step
    And check all input field values


  Scenario : print page
    Given I navigate to "DogHoldingLic" page
    When I click on header "הדפס" button
    Then check preview page
    When click "action"

