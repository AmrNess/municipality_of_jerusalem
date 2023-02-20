Feature: Testing funding tickets page FORM 1 ONLY
  - Feature file name: funding_tickets_test_form1.feature
  - Form link: https://jeronlineforms-test.jerweb.jer/FundingTickets
  - Form link: https://jeronlineforms-test.jerweb.jer/FundingTickets
  - Number of Pages is : 4, We are at Page: 1
  - All fields are mandatory except "טלפון קווי" text field

  @minor
  @header
  Scenario: check header is displayed properly
    Given I navigate to "FundingTickets" page
    Then I check if the header and is displayed
    Then I check if the header "logo" ins displayed
    Then I check if the header "Title" is displayed and have more than "5" character
    Then I check that this form is form number "4"
    Then I check if the explanation is displayed

  @minor
  @footer
   Scenario: check if footer is displayed and have text
   Given I navigate to "FundingTickets" page
   Then I check if the footer is displayed and have more than 10 character

  @critical
  @form
  Scenario: check if I.D field  is displayed
    Given I navigate to "FundingTickets" page
    When I choose "ת.ז." in "סוג זיהוי"
    Then I check if "מספר ת.ז." is displayed

  @critical
  @form
  Scenario Outline: I.D. field test with invalid values to test the alert "not correct" message
    Given I navigate to "FundingTickets" page
    When I choose "ת.ז." in "סוג זיהוי"
    When I write "<text>" in "מספר ת.ז."
    Then field "מספר ת.ז." has invalid value and with alert "מספר זהות לא תקין"
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
  Scenario Outline: I.D. field test with valid values
    Given I navigate to "FundingTickets" page
    When I choose "ת.ז." in "סוג זיהוי"
    When I write "<text>" in "מספר ת.ז."
    Then field "מספר ת.ז." has valid value
    Examples:
    | text  |
    |302799952|
    |32069445|

  @critical
  @form
  Scenario: check passport field  is displayed
    Given I navigate to "FundingTickets" page
    When I choose "דרכון" in "סוג זיהוי"
    Then I check if "מספר דרכון" is displayed

  @critical
  @form
  Scenario Outline: PassPort field test with invalid values to test the alert "not correct" message
    Given I navigate to "FundingTickets" page
    When I choose "דרכון" in "סוג זיהוי"
    When I write "<text>" in "מספר דרכון"
    Then field "מספר דרכון" has invalid value and with alert "מספר זהות לא תקין"
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
  Scenario Outline: I.D. field test with valid values
    Given I navigate to "FundingTickets" page
    When I choose "דרכון" in "סוג זיהוי"
    When I write "<text>" in "מספר דרכון"
    Then field "מספר דרכון" has valid value
    Examples:
    | text  |
    |302799952|
    |32069445|

  @critical
  @form
  Scenario Outline: First name field test with invalid values to test the alert "only numbers and special characters allowed" message
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "שם פרטי"
    Then field "שם פרטי" has invalid value and with alert "יש להזין אותיות בעברית בלבד ותווים מיוחדים"
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
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "שם פרטי"
    Then field "שם פרטי" has valid value
    Examples:
    | text  |
    |גדכגדכ|
    |דגכככככככככ|
    |םיעןחפםעיח|
    |שדגכעיחלךלחיעכגדגכעיחלךלחיעכגדגכעיחלךלחיעכגכעיחלךל|
    |ךלחגדכ(דגכ)|
    |ש|


  @critical
  @form
  Scenario Outline: Family name field test with invalid values to test the alert "only numbers and special characters allowed" message
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "שם משפחה"
    Then field "שם משפחה" has invalid value and with alert "יש להזין אותיות בעברית בלבד ותווים מיוחדים"
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
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "שם משפחה"
    Then field "שם משפחה" has valid value
    Examples:
    |גדכגדכ|
    |דגכככככככככ|
    |םיעןחפםעיח|
    |שדגכעיחלךלחיעכגדגכעיחלךלחיעכגדגכעיחלךלחיעכגכעיחלךל|
    |ךלחגדכ(דגכ)|
    |ש|


  @critical
  @form
  Scenario Outline: Mobile phone field test with invalid values to test the alert "Numbers only" message
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "טלפון נייד"
    Then field "טלפון נייד" has invalid value and with alert "יש להזין ספרות בלבד"
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
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "טלפון נייד"
    Then field "טלפון נייד" has invalid value and with alert "יש להשלים את הספרות החסרות"
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
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "טלפון נייד"
    Then field "טלפון נייד" has valid value
    Examples:
      | text |
      |053-7133772|
      |050-6393648|
      |077-7383632|

  @critical
  @form
  Scenario Outline: Land-line phone field test with invalid values to test "only numbers" alert
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "טלפון קווי"
    Then field "טלפון קווי" has invalid value and with alert "יש להזין ספרות בלבד"
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
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "טלפון קווי"
    Then field "טלפון קווי" has invalid value and with alert "יש להשלים את הספרות החסרות"
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
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "טלפון קווי"
    Then field "טלפון קווי" has valid value
    Examples:
      | text |
      |053-7133772|
      |073-7383632|


  @critical
  @form
  Scenario Outline: Email field test with invalid values to test "incorrect feild" alert
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "דוא"ל"
    Then field "דוא"ל" has invalid value and with alert "שדה לא תקין"
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
    Given I navigate to "FundingTickets" page
    When I write "<text>" in "דוא"ל"
    Then field "דוא"ל" has valid value
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





