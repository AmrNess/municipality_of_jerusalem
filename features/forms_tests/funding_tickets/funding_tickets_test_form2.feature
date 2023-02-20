Feature: Testing funding tickets page FORM 2 ONLY
  - Feature file name: funding_tickets_test_form2.feature
  - Form link: https://jeronlineforms-test.jerweb.jer/FundingTickets
  - Number of Pages is : 4, We are at Page: 2
  - All fields are mandatory except.

  @minor
  @header
  Scenario: check header is displayed properly
    Given I navigate to "FundingTickets" page
    Then I check if the header and is displayed
    Then I check if the header "logo" ins displayed
    Then I check if the header "Title" is displayed and have more than "5" character
    Then I check that this form is form number "2"
    Then I check if the explanation is displayed

  @minor
  @footer
   Scenario: check if footer is displayed and have text
   Given I navigate to "FundingTickets" page
   Then I check if the footer is displayed and have more than 10 character

  @critical
  @form
  Scenario: check if I.D field  is displayed in student details
    Given I navigate to "FundingTickets" page
    When I choose "ת.ז." in "סוג זיהוי" in part "פרטי תלמיד"
    Then I check if "מספר ת.ז." is displayed in part "פרטי תלמיד"

  @critical
  @form
  Scenario Outline: I.D. field test with invalid values to test the alert "not correct" message in student details
    Given I navigate to "FundingTickets" page
    When I choose "ת.ז." in "סוג זיהוי" in part "פרטי תלמיד"
    When I write "<text>" in "מספר ת.ז." in part "פרטי תלמיד"
    Then field "מספר ת.ז." has invalid value and with alert "מספר זהות לא תקין" in part "פרטי תלמיד"
    Examples:
    | text |
    |000000000|
    |000000009|
    |000000018|
    |2345|
    |ab123456|
    |12341234567|
    |12-3456789|
    |1234:56789|
    |1234ab56|
    |1234 56789|
    |1234_56789|
    |1234.56789|
    |12a3456789|
    |12b3456789|
    |12c3456789|
    |12d3456789|
    |12e3456789|
    |12f3456789|


  @critical
  @form
  Scenario Outline: I.D. field test with valid values in student details
    Given I navigate to "FundingTickets" page
    When I choose "ת.ז." in "סוג זיהוי" in part "פרטי תלמיד"
    When I write "<text>" in "מספר ת.ז." in part "פרטי תלמיד"
    Then field "מספר ת.ז." has valid value in part "פרטי תלמיד"
    Examples:
    | text  |
    |302799952|
    |32069445|

  @critical
  @form
  Scenario: check passport field  is displayed in student details
    Given I navigate to "FundingTickets" page
    When I choose "דרכון" in "סוג זיהוי" in part "פרטי תלמיד"
    Then I check if "מספר דרכון" is displayed in part "פרטי תלמיד"

  @critical
  @form
  Scenario Outline: PassPort field test with invalid values to test the alert "not correct" message in student details
    Given I navigate to "FundingTickets" page
    When I choose "דרכון" in "סוג זיהוי" in part "פרטי תלמיד"
    When I write "<text>" in "מספר דרכון" in part "פרטי תלמיד"
    Then field "מספר דרכון" has invalid value and with alert "מספר זהות לא תקין" in part "פרטי תלמיד"
    Examples:
    | text |
    |000000000|
    |000000009|
    |000000018|
    |2345|
    |ab123456|
    |12341234567|
    |12-3456789|
    |1234:56789|
    |1234ab56|
    |1234 56789|
    |1234_56789|
    |1234.56789|
    |12a3456789|
    |12b3456789|
    |12c3456789|
    |12d3456789|
    |12e3456789|
    |12f3456789|


  @critical
  @form
  Scenario Outline: I.D. field test with valid values in student details
    Given I navigate to "FundingTickets" page
    When I choose "דרכון" in "סוג זיהוי" in part "פרטי תלמיד"
    When I write "<text>" in "מספר דרכון" in part "פרטי תלמיד"
    Then field "מספר דרכון" has valid value in part "פרטי תלמיד"
    Examples:
    | text  |
    |302799952|
    |32069445|

  @critical
  @form
  Scenario Outline: Pick birthday date test in  student details
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "תאריך לידה" in part "פרטי תלמיד"
    Then field "מספר דרכון" has value "<text>"  in part "פרטי תלמיד"
    Examples:
    | text  |
    |11-11-2003|
    |13-02-2005|

  @critical
  @form
  Scenario Outline: Roadblock button field  if pressed at parent details
    Given I navigate to "FundingTickets" page
    When press "<text>" in "הורה שונה ממגיש הבקשה" in part "פרטי הורה"
    Then Validate if "<text>" in "הורה שונה ממגיש הבקשה" is pressed
    Examples:
    |text|
    |כן|
    |לא|


  @critical
  @form
  Scenario: check if I.D field  is displayed in parent details
    Given I navigate to "FundingTickets" page
    When I press "כן" in "הורה שונה ממגיש הבקשה" in part "פרטי הורה"
    When I choose "ת.ז." in "סוג זיהוי" in part "פרטי הורה"
    Then I check if "מספר ת.ז." is displayed in part "פרטי הורה"

  @critical
  @form
  Scenario Outline: I.D. field test with invalid values to test the alert "not correct" message in parent details
    Given I navigate to "FundingTickets" page
    When I press "כן" in "הורה שונה ממגיש הבקשה" in part "פרטי הורה"
    When I choose "ת.ז." in "סוג זיהוי" in part "פרטי תלמיד"
    When I write "<text>" in "מספר ת.ז." in part "פרטי תלמיד"
    Then field "מספר ת.ז." has invalid value and with alert "מספר זהות לא תקין" in part "פרטי תלמיד"
    Examples:
    | text |
    |000000000|
    |000000009|
    |000000018|
    |2345|
    |ab123456|
    |12341234567|
    |12-3456789|
    |1234:56789|
    |1234ab56|
    |1234 56789|
    |1234_56789|
    |1234.56789|
    |12a3456789|
    |12b3456789|
    |12c3456789|
    |12d3456789|
    |12e3456789|
    |12f3456789|


  @critical
  @form
  Scenario Outline: I.D. field test with valid values in parent details
    Given I navigate to "FundingTickets" page
    When I press "כן" in "הורה שונה ממגיש הבקשה" in part "פרטי הורה"
    When I choose "ת.ז." in "סוג זיהוי" in part "פרטי תלמיד"
    When I write "<text>" in "מספר ת.ז." in part "פרטי תלמיד"
    Then field "מספר ת.ז." has valid value in part "פרטי תלמיד"
    Examples:
    | text  |
    |302799952|
    |32069445|

  @critical
  @form
  Scenario: check passport field  is displayed in student details
    Given I navigate to "FundingTickets" page
    When I press "כן" in "הורה שונה ממגיש הבקשה" in part "פרטי הורה"
    When I choose "דרכון" in "סוג זיהוי" in part "פרטי תלמיד"
    Then I check if "מספר דרכון" is displayed in part "פרטי תלמיד"

  @critical
  @form
  Scenario Outline: PassPort field test with invalid values to test the alert "not correct" message in parent details
    Given I navigate to "FundingTickets" page
    When I press "כן" in "הורה שונה ממגיש הבקשה" in part "פרטי הורה"
    When I choose "דרכון" in "סוג זיהוי" in part "פרטי תלמיד"
    When I write "<text>" in "מספר דרכון" in part "פרטי תלמיד"
    Then field "מספר דרכון" has invalid value and with alert "מספר זהות לא תקין" in part "פרטי תלמיד"
    Examples:
    | text |
    |000000000|
    |000000009|
    |000000018|
    |2345|
    |ab123456|
    |12341234567|
    |12-3456789|
    |1234:56789|
    |1234ab56|
    |1234 56789|
    |1234_56789|
    |1234.56789|
    |12a3456789|
    |12b3456789|
    |12c3456789|
    |12d3456789|
    |12e3456789|
    |12f3456789|


  @critical
  @form
  Scenario Outline: I.D. field test with valid values in parent details
    Given I navigate to "FundingTickets" page
    When I press "כן" in "הורה שונה ממגיש הבקשה" in part "פרטי הורה"
    When I choose "דרכון" in "סוג זיהוי" in part "פרטי תלמיד"
    When I write "<text>" in "מספר דרכון" in part "פרטי תלמיד"
    Then field "מספר דרכון" has valid value in part "פרטי תלמיד"
    Examples:
    | text  |
    |302799952|
    |32069445|

