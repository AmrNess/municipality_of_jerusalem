Feature: Testing photo permission page FORM 2 ONLY

  - Feature file name: photo_permission_test_form2.feature
  - Form link: https://jeronlineforms-test.jerweb.jer/PhotoPermission
  - Number of Pages is : 3, We are at Page: 2
  - All fields are mandatory.

  @minor
  @header
  Scenario: explanation is displayed
    Given I navigate to "PhotoPermission" page
    Then I check if the header and is displayed
    Then I check if the header "logo" ins displayed
    Then I check if the header "Title" is displayed and have more than "5" character
    Then I check that this form is form number "2"

  @minor
  @footer
   Scenario: check if footer is displayed and have text
   Given I navigate to "PhotoPermission" page
   Then I check if the footer is displayed and have more than 10 character

  @critical
  @form
  Scenario Outline: Check name of the production company field test with invalid values to test the alert "only numbers and special characters allowed" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "שם חברת ההפקה"
    Then field "שם חברת ההפקה" has invalid value and with alert "יש להזין אותיות בעברית בלבד ותווים מיוחדים"
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
  Scenario Outline: name of production company field test with valid values
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "שם חברת ההפקה"
    Then field "שם חברת ההפקה" has valid value
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
  Scenario Outline: Mobile phone of production company field test with invalid values to test the alert "Numbers only" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "טלפון חברת ההפקה"
    Then field "טלפון חברת ההפקה" has invalid value and with alert "יש להזין ספרות בלבד"
    Examples:
      | text |
      |dd-7133772|
      |053-oiخهع|
      |يت-تننتاتنا|
      |07-3457654387646734567 |
      |053-34876556734567 |

  @critical
  @form
  Scenario Outline: Mobile phone of production company field test with invalid values to test "missing numbers" alert
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "טלפון חברת ההפקה"
    Then field "טלפון חברת ההפקה" has invalid value and with alert "יש להשלים את הספרות החסרות"
    Examples:
      | text |
      |dd-1|
      |053-12|
      |123-تننتاتنا|
      |07-76554|
      |053-12|

  @critical
  @form
  Scenario Outline: Address of production company test with invalid values to test the alert "only numbers and special characters allowed" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "כתובת חברת ההפקה"
    Then field "כתובת חברת ההפקה" has invalid value and with alert "יש להזין אותיות בעברית בלבד ותווים מיוחדים"
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
  Scenario Outline: Address of production company field test with valid values
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "כתובת חברת ההפקה"
    Then field "כתובת חברת ההפקה" has valid value
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
  Scenario Outline: name of the production coordinator field test with invalid values to test the alert "only numbers and special characters allowed" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "שם מתאם ההפקה"
    Then field "שם מתאם ההפקה" has invalid value and with alert "יש להזין אותיות בעברית בלבד ותווים מיוחדים"
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
  Scenario Outline: name of the production coordinator field test with valid values
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "שם מתאם ההפקה"
    Then field "שם מתאם ההפקה" has valid value
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
  Scenario Outline: Mobile of the production coordinator field test with invalid values to test the alert "Numbers only" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "טלפון מתאם ההפקה"
    Then field "טלפון מתאם ההפקה" has invalid value and with alert "יש להזין ספרות בלבד"
    Examples:
      | text |
      |dd-7133772|
      |053-oiخهع|
      |يت-تننتاتنا|
      |07-3457654387646734567 |
      |053-34876556734567 |

  @critical
  @form
  Scenario Outline: Mobile of the production coordinator field test with invalid values to test "missing numbers" alert
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "טלפון מתאם ההפקה"
    Then field "טלפון מתאם ההפקה" has invalid value and with alert "יש להשלים את הספרות החסרות"
    Examples:
      | text |
      |dd-1|
      |053-12|
      |123-تننتاتنا|
      |07-76554|
      |053-12|


  @critical
  @form
  Scenario Outline: Email field test with invalid values to test "incorrect field" alert
    Given I navigate to "PhotoPermission" page
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
    Given I navigate to "PhotoPermission" page
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


@critical
  @form
  Scenario Outline: Name of the person for whom the photo is taken field test with invalid values to test the alert "only numbers and special characters allowed" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "שם הגורם עבורו מתבצע הצילום"
    Then field "שם הגורם עבורו מתבצע הצילום" has invalid value and with alert "יש להזין אותיות בעברית בלבד ותווים מיוחדים"
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
  Scenario Outline: Name of the person for whom the photo is taken field test with valid values
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "שם הגורם עבורו מתבצע הצילום"
    Then field "שם הגורם עבורו מתבצע הצילום" has valid value
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
  Scenario Outline: check if media type dropdown work as intended
    Given I navigate to "PhotoPermission" page
    When I choose "<text>" in "סוג המדיה"
    Then I check if "<text>" is written in the dropdown "סוג המדיה"
    Examples:
    | text|
    | סרט וידיאו|
    | קליפ|
    | הפקת אופנה|
    |סרט סטודנטים|
    |סדרת טלוויזיה|


  @critical
  @form
  Scenario: check if other input that shown after choosing others is media type
    Given I navigate to "PhotoPermission" page
    When I choose "אחר" in "סוג המדיה"
    Then I check if "אחר" is written in the dropdown "סוג המדיה"
    Then I check if "פירוט" field is displayed

  @critical
  @form
  Scenario Outline: test the details input that shown after choosing others is media type and test it with invalid values
    Given I navigate to "PhotoPermission" page
    When I choose "אחר" in "סוג המדיה"
    When I write "<text>" in "פירוט"
    Then field "פירוט" should have invalid value and with alert "יש להזין אותיות בעברית בלבד ותווים מיוחדים"
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
  Scenario Outline:  test the details input that shown after choosing others is media type and test it with invalid values
   Given I navigate to "PhotoPermission" page
    When I choose "אחר" in "סוג המדיה"
    When I write "<text>" in "פירוט"
    Then field "פירוט" has valid value
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
  Scenario Outline: Name of the person for whom the photo is taken field test with invalid values to test the alert "only numbers and special characters allowed" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "שם הגורם עבורו מתבצע הצילום"
    Then field "שם הגורם עבורו מתבצע הצילום" has invalid value and with alert "שפת קלט לא תקינה"
    Examples:
    | text  |
    |sdsdf  |
    |سيبس][ |
    |شسيسييسشييبس|
    |سشيسشيשדגגשד|
    |שדגD3E32EFDSF|

  @critical
  @form
  Scenario Outline: Name of the person for whom the photo is taken field test with valid values
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "שם הגורם עבורו מתבצע הצילום"
    Then field "שם הגורם עבורו מתבצע הצילום" has invalid value
    Examples:
    | text  |
    |גדכגדכ|
    |דגכככככככככ|
    |םיעןחפםעיח|
    |שדגכעיחלךלחיעכגדגכעיחלךלחיעכגדגכעיחלךלחיעכגכעיחלךל|
    |ךלחגדכ(דגכ)|
    |ש|

   @minor
   @savebutton
   @popup
   Scenario: check if save content button shows popup after clicking it
   Given I navigate to "PhotoPermission" page
   Then I check that this form is form number "2"
   Then I check if i click "שמור" a popup with title "שמור טיוטה" is displayed
   Then check if popup "שמור טיוטה" text have more than "10" characters
   Then check if popup "שמור טיוטה" text includes text "שמירת הטיוטה מאפשרת לך להמשיך במילוי"
   Then I click close button of popup "שמור טיוטה"
   Then check if popup "שמור טיוטה" is not displayed