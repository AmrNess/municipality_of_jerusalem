Feature: Testing confirmation for structure page FORM 1 ONLY

  - Feature file name: confirmation_test_from1.feature
  - Form link: https://jeronlineforms-test.jerweb.jer/ConfirmationForStructure
  - Number of Pages is : 3, We are at Page: 1
  - All fields are mandatory except telephone number.

  @minor
  @header
  Scenario: check all the header components are displayed and correct
    Given I navigate to "ConfirmationForStructure" page
    Then I check if the header and is displayed
    Then I check if the header "logo" ins displayed
    Then I check if the header "Title" is displayed and have more than "5" character
    Then I check if the header language "hebrew" button is clickable
    Then I check if the header language "arabic" button is clickable
    Then I check that this form is form number "1"
    Then I check if the explanation is displayed and have more than "20" character


  @minor
  @footer
   Scenario: check if footer is displayed and have text
   Given I navigate to "ConfirmationForStructure" page
   Then I check if the footer is displayed and have more than 10 character



  @critical
  @form
  Scenario Outline: I.D. field test with invalid values to test the alert "not correct" message
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "מספר ת.ז."
    Then field "מספר ת.ז." should have invalid value and with alert "מספר זהות לא תקין"
    Examples:
    | text |
    |000000000|
    |000000009|
    |000000018|
    #bug
    |2345|
    #-----
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
  Scenario Outline: I.D. field test with valid values
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "מספר ת.ז."
    Then field "מספר ת.ז." should have valid value
    Examples:
    | text  |
    |302799952|
    |32069445|

  @critical
  @form
  Scenario Outline: First name field test with invalid values to test the alert "only hebrew  and special characters allowed" message
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "שם פרטי"
    Then field "שם פרטי" should have invalid value and with alert "יש להזין אותיות בעברית בלבד ותווים מיוחדים"
    Examples:
    | text  |
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
    | אבג/12 |
    | דהו!   |
    | זחט@   |
    | יכל#   |
    | מנס$   |
    | פצק%   |
    | רשת^   |
    | בגדי&   |
    | הוזח*   |
    | לכמנ+   |
    | אבג/12 |
    | דהו!   |
    | זחט@   |
    | יכל#   |
    | מנס$   |
    | פצק%   |
    | רשת^   |
    |32kj4k324|
    |432اتتاלחךל|
    |כגד09לחi09تهךח|
    |234324324|
    | בגדי&   |
    | הוזח*   |
    | לכמנ+   |
    | אבג/() |
    | רשת12  |
    |חכלכיעחלך|
    | בגדי!  |
    | הוזח@  |
    | לכמנ#  |

  @critical
  @form
  Scenario Outline: First name field test with valid values
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "שם פרטי"
    Then field "שם פרטי" should have valid value
    Examples:
    |text|
    |גדכגדכ|
    |דגכככככככככ|
    |םיעןחפםעיח|
    |שדגכעיחלךלחיעכגדגכעיחלךלחיעכגדגכעיחלךלחיעכגכעיחלךל|
    |ךלחגדכ(דגכ)|
    |ש|


  @critical
  @form
  Scenario Outline: Family name field test with invalid values to test the alert "only numbers and special characters allowed" message
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "שם משפחה"
    Then field "שם משפחה" should have invalid value and with alert "יש להזין אותיות בעברית בלבד ותווים מיוחדים"
    Examples:
    | text  |
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
    | אבג/12 |
    | דהו!   |
    | זחט@   |
    | יכל#   |
    | מנס$   |
    | פצק%   |
    | רשת^   |
    | בגדי&   |
    | הוזח*   |
    | לכמנ+   |
    | אבג/12 |
    | דהו!   |
    | זחט@   |
    | יכל#   |
    | מנס$   |
    | פצק%   |
    | רשת^   |
    |32kj4k324|
    |432اتتاלחךל|
    |כגד09לחi09تهךח|
    |234324324|
    | בגדי&   |
    | הוזח*   |
    | לכמנ+   |
    | אבג/() |
    | רשת12  |
    |חכלכיעחלך|
    | בגדי!  |
    | הוזח@  |
    | לכמנ#  |

  @critical
  @form
  Scenario Outline: Family name field test with valid values
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "שם משפחה"
    Then field "שם משפחה" should have valid value
    Examples:
    |text|
    |גדכגדכ|
    |דגכככככככככ|
    |םיעןחפםעיח|
    |שדגכעיחלךלחיעכגדגכעיחלךלחיעכגדגכעיחלךלחיעכגכעיחלךל|
    |ךלחגדכ(דגכ)|
    |ש|


  @critical
  @form
  Scenario Outline: Mobile phone field test with invalid values to test the alert "Numbers only" message
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "טלפון נייד"
    Then field "טלפון נייד" should have invalid value and with alert "יש להזין ספרות בלבד"
    Examples:
      | text |
      |dd-7133772|
      |053-oiخهع|
      |يت-تننتاتنا|
      |07-3457654387646734567 |
      |053-34876556734567 |

  @critical
  @form
  Scenario Outline: Mobile phone field test with invalid values to test "missing numbers" alert
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "טלפון נייד"
    Then field "טלפון נייד" should have invalid value and with alert "יש להשלים את הספרות החסרות"
    Examples:
      | text |
      |dd-1|
      |053-12|
      |123-تننتاتنا|
      |07-76554|
      |053-12|


  @critical
  @form
  Scenario Outline:  Mobile phone field test with valid values
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "טלפון נייד"
    Then field "טלפון נייד" should have valid value
    Examples:
      | text |
      |053-7133772|
      |050-6393648|
      |077-7383632|

  @critical
  @form
  Scenario Outline: Land-line phone field test with invalid values to test "only numbers" alert
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "טלפון קווי"
    Then field "טלפון קווי" should have invalid value and with alert "יש להזין ספרות בלבד"
    Examples:
      | text |
      |dd-7133772|
      |053-oiخهع|
      |يت-تننتاتنا|
      |07-3457654387646734567 |
      |053-34876556734567 |

  @critical
  @form
  Scenario Outline: Land-line phone field test with invalid values to test "missing numbers" alert
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "טלפון קווי"
    Then field "טלפון קווי" should have invalid value and with alert "יש להשלים את הספרות החסרות"
    Examples:
      | text |
      |dd-1|
      |053-12|
      |123-تننتاتنا|
      |07-76554|
      |053-12|


  @critical
  @form
  Scenario Outline: Land-line phone field test with valid values
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "טלפון קווי"
    Then field "טלפון קווי" should have valid value
    Examples:
      | text |
      |053-7133772|
      |073-7383632|


  @critical
  @form
  Scenario Outline: Email field test with invalid values to test "incorrect feild" alert
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "דוא"ל"
    Then field "דוא"ל" should have invalid value and with alert "שדה לא תקין"
    Examples:
      |text|
      |user@.com|
      | @missingusername.com|
      | user@missingtld|
      | user@.missingtld.|
      | user@missingtld.|
      | user@-invalidtld.com|
      | plainaddress |
      | #@%^%#$@#$@#.com|
      | @missingatsign.com|
      | missingdot@.com|
      | two@@missingatsigns.com|
      | leadingdot@.com|
      | .leadingdot@com.com|
      | email.with!symbol@com.com|
      | email.with%percent@com.com|
      | email.with_underscore@com.com|
      |SDFG56ש@FG5.FG|

  @critical
  @form
  Scenario Outline: Email field test with valid values
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "דוא"ל"
    Then field "דוא"ל" should have valid value
   Examples:
    | text|
    | user@example.com|
    | user@example.co.il|
    | user.name@example.co.il|
    | user.name@example.com|
    | user_name@example.com|
    | user+name@example.com|
    | user.nametag@example.com|
    | user@subdomain.example.com|
    | user@sub.example.com|
    | user@sub-domain.example.com|
    |FH2345@F6G.UH|
    |ASSSSSSSSSSSSSSSSSERTYUIOIUYRDFGHJKL@ERTY.TYUI|






