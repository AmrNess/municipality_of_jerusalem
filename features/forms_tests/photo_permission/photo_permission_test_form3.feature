Feature: Testing photo permission page FORM 3 ONLY

  - Feature file name: photo_permission_test_form3.feature
  - Form link: https://jeronlineforms-test.jerweb.jer/PhotoPermission
  - Number of Pages is : 4, We are at Page: 3
  - All fields are mandatory.

  @minor
  @header
  Scenario: explanation is displayed
    Given I navigate to "PhotoPermission" page
    Then I check if the header and is displayed
    Then I check if the header "logo" ins displayed
    Then I check if the header "Title" is displayed and have more than "5" character
    Then I check that this form is form number "3"

  @minor
  @footer
   Scenario: check if footer is displayed and have text
   Given I navigate to "PhotoPermission" page
   Then I check if the footer is displayed and have more than 10 character


  @critical
  @form
  Scenario Outline: Check date field in the accordion table with invalid values to test the alert "date not correct" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "תאריך" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then field "תאריך" in table "פרטי המיקום ומועדי הצילומים" at index "1" has invalid value and with alert "תאריך לא תקין"
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

  @minor
  @form
  Scenario: check title of index in the accordion table if chages when the date field change
    Given I navigate to "PhotoPermission" page
    When I write "11 11 2023" in "תאריך" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then  table "פרטי המיקום ומועדי הצילומים" title at index "1" has value "11 11 2023"

  @minor
  @form
  Scenario: check table length if increases when adding new row
    Given I navigate to "PhotoPermission" page
    When I click "הוסף מועד" in table "פרטי המיקום ומועדי הצילומים"
    Then  I check if table "פרטי המיקום ומועדי הצילומים" length is "2"

  @minor
  @form
  Scenario: check table length if decreases when removing a row by index
    Given I navigate to "PhotoPermission" page
    When I click "הוסף מועד" in table "פרטי המיקום ומועדי הצילומים"
    When I click "trash" in table "פרטי המיקום ומועדי הצילומים" at index "2"
    Then  I check if table "פרטי המיקום ומועדי הצילומים" length "1"

  @minor
  @form
  Scenario: check trash button at index 1 in the table is not clickable
    Given I navigate to "PhotoPermission" page
    Then  I check if button "trash" at table "פרטי המיקום ומועדי הצילומים" is not clickable

  @critical
  @form
  Scenario Outline: Check date field in the accordion table with dates that older than today's date (20-02-2023) to test the alert "the date should be after (today's date))" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "תאריך" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then field "תאריך" in table "פרטי המיקום ומועדי הצילומים" at index "1" has invalid value and with alert "תאריך חייב להיות אחרי"
    Examples:
    | text  |
    | 11 11 1212 |
    | 31 09 1990  |
    |11 11 2022   |


  @critical
  @form
  Scenario Outline: write in the starting time field at the accordion table and check that the inserted time is displayed
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "שעת התחלה" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then field "שעת התחלה" in table "פרטי המיקום ומועדי הצילומים" at index "1" has value "<text>" displayed
    Examples:
    | text  |
    | 11:11 |
    | 24:09 |
    | 20:11 |

  @critical
  @form
  Scenario Outline: write in the finishing time field at the accordion table and check that the inserted time is displayed
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "שעת סיום" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then field "שעת סיום" in table "פרטי המיקום ומועדי הצילומים" at index "1" has value "<text>" displayed
    Examples:
    | text  |
    | 11:11 |
    | 24:09 |
    | 20:11 |

  @critical
  @form
  Scenario Outline: write in the finishing time field at the accordion table and check invalid values (time is before starting time) with alert "שעת הסיום צריכה להיות גדולה משעת ההתחלה"
    Given I navigate to "PhotoPermission" page
    When I write "11:00" in "שעת התחלה" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    When I write "<text>" in "שעת סיום" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then field "שעת סיום" in table "פרטי המיקום ומועדי הצילומים" at index "1" has invalid value and with alert "שעת הסיום צריכה להיות גדולה משעת ההתחלה"
    Examples:
    | text  |
    | 10:11 |
    | 09:09 |
    | 03:11 |

  @critical
  @form
  Scenario Outline: write in the finishing time field at the accordion table and check valid values (time is after starting time)
    Given I navigate to "PhotoPermission" page
    When I write "11:00" in "שעת התחלה" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    When I write "<text>" in "שעת סיום" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then field "שעת סיום" in table "פרטי המיקום ומועדי הצילומים" at index "1" has value "<text>" displayed
    Examples:
    | text  |
    | 12:11 |
    | 20:09 |
    | 23:11 |

  @critical
  @form
  Scenario Outline: Check "מספר אנשי צוות" field in the accordion table that it takes only numbers at maximum 3 digits
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "מספר אנשי צוות" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then field "מספר אנשי צוות" in table "פרטי המיקום ומועדי הצילומים" at index "1" should have first "3" digit from the inserted value
    Examples:
    | text  |
    |1234567|
    |345    |
    |765432543243|

  @critical
  @form
  Scenario Outline: Check name of the site text field in the accordion table with invalid values to test the alert "only hebrew  and special characters allowed" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "שם האתר" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then field "שם האתר" in table "פרטי המיקום ומועדי הצילומים" at index "1" has invalid value and with alert "יש להזין אותיות בעברית בלבד ותווים מיוחדים"
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
  Scenario Outline: Check name of the site text field in the accordion table with valid values
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "שם האתר" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then field "שם האתר" in table "פרטי המיקום ומועדי הצילומים" at index "1" should have valid value
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
  Scenario Outline: Check address text field in the accordion table with invalid values to test the alert "only specific special characters allowed" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "כתובת" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then field "כתובת" in table "פרטי המיקום ומועדי הצילומים" at index "1" has invalid value and with alert "בתוים מיוחדים ניתן להזין רק"
    Examples:
    | text  |
    | אבגד/()'.,_-זחט!  |
    | אבגד/()'.,_-זחט@  |
    | אבגד/()'.,_-זחט#  |
    | אבגד/()'.,_-זחט$  |
    | אבגד/()'.,_-זחט%  |
    | אבגד/()'.,_-זחט^  |
    | אבגד/()'.,_-זחט&  |
    | אבגד/()'.,_-זחט*  |
    | אבגד/()'.,_-זחט+  |
    | דהו!   |
    | זחט@   |
    | יכל#   |
    | מנס$   |
    | פצק%   |
    | רשת^   |
    | בגדי&   |
    | הוזח*   |
    | לכמנ+   |
    | דהו!   |
    | זחט@   |
    | יכל#   |
    | מנס$   |
    | פצק%   |
    | רשת^   |
    | בגדי&   |
    | הוזח*   |
    | לכמנ+   |
    | בגדי!  |
    | הוזח@  |
    | לכמנ#  |

  @critical
  @form
  Scenario Outline: Check name of the site text field in the accordion table with valid values
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "כתובת" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then field "כתובת" in table "פרטי המיקום ומועדי הצילומים" at index "1" should have valid value
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
  Scenario Outline: Roadblock button field in the accordion table if pressed
    Given I navigate to "PhotoPermission" page
    When press "<text>" in "חסימת כביש" from table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then Validate if "<text>" in "חסימת כביש" from table "פרטי המיקום ומועדי הצילומים" at index "1" is pressed
    Examples:
    |text|
    |לא קיימת חסימה|
    |הרמטית|
    |חסימת מדרכה|

  @critical
  @form
  Scenario Outline: Roadblock button field  if pressed
    Given I navigate to "PhotoPermission" page
    When press "<text>" in "האם יש חיבור לחשמל/גנרטור"
    Then Validate if "<text>" in "חסימת כביש" is pressed
    Examples:
    |text|
    |כן|
    |לא|

  @critical
  @form
  Scenario Outline: Writing in text field "פירוט השימוש בחשמל" with invalid values to test the alert "language is incorrect" message
    Given I navigate to "PhotoPermission" page
    When press "כן" in "האם יש חיבור לחשמל/גנרטור"
    When I write "<text>" in "פירוט השימוש בחשמל"
    Then field "פירוט השימוש בחשמל" has invalid value and with alert "שפת קלט לא תקינה"
    Examples:
    | text  |
    |sdsdf  |
    |سيبس][ |
    |شسيسييسشييبس|
    |سشيسشيשדגגשד|
    |שדגD3E32EFDSF|

  @critical
  @form
  Scenario Outline: Writing in text field "פירוט השימוש בחשמל" with valid values
    Given I navigate to "PhotoPermission" page
    When press "כן" in "האם יש חיבור לחשמל/גנרטור"
    When I write "<text>" in "פירוט השימוש בחשמל"
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
  Scenario Outline: Writing in text field "פירוט שימוש באמצעי הפקה, אפקטים שונים (כגון ירי/פיצוץ)" with invalid values to test the alert "language is incorrect" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "פירוט שימוש באמצעי הפקה, אפקטים שונים (כגון ירי/פיצוץ)"
    Then field "פירוט שימוש באמצעי הפקה, אפקטים שונים (כגון ירי/פיצוץ)" has invalid value and with alert "שפת קלט לא תקינה"
    Examples:
    | text  |
    |sdsdf  |
    |سيبس][ |
    |شسيسييسشييبس|
    |سشيسشيשדגגשד|
    |שדגD3E32EFDSF|

  @critical
  @form
  Scenario Outline: Writing in text field "פירוט שימוש באמצעי הפקה, אפקטים שונים (כגון ירי/פיצוץ)" with valid values
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "פירוט שימוש באמצעי הפקה, אפקטים שונים (כגון ירי/פיצוץ)"
    Then field "פירוט שימוש באמצעי הפקה, אפקטים שונים (כגון ירי/פיצוץ)" has valid value
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
  Scenario Outline: Writing in text field "פירוט ציוד צילום" with invalid values to test the alert "language is incorrect" message
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "פירוט ציוד צילום"
    Then field "פירוט ציוד צילום" has invalid value and with alert "שפת קלט לא תקינה"
    Examples:
    | text  |
    |sdsdf  |
    |سيبس][ |
    |شسيسييسشييبس|
    |سشيسشيשדגגשד|
    |שדגD3E32EFDSF|

  @critical
  @form
  Scenario Outline: Writing in text field "פירוט ציוד צילום" with valid values
    Given I navigate to "PhotoPermission" page
    When I write "<text>" in "פירוט ציוד צילום"
    Then field "פירוט ציוד צילום" has valid value
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
   Then I check that this form is form number "3"
   Then I check if i click "שמור" a popup with title "שמור טיוטה" is displayed
   Then check if popup "שמור טיוטה" text have more than "10" characters
   Then check if popup "שמור טיוטה" text includes text "שמירת הטיוטה מאפשרת לך להמשיך במילוי"
   Then I click close button of popup "שמור טיוטה"
   Then check if popup "שמור טיוטה" is not displayed

   @minor
   @savebutton
   @popup
   Scenario: check if clicking save content button return to same page
   Given I navigate to "PhotoPermission" page
   Then I check that this form is form number "3"
   Then I check if i click "שמור טיוטה" a popup with title "שמור טיוטה" is displayed
   Then at the popup "שמור טיוטה" click button "שמור טיוטה"
   Then I check that this form is form number "3"

  @critical
  @form
  Scenario: verify required input field that have alert with message "field required"
    Given I navigate to "PhotoPermission" page
    When click on "המשך" button
    Then Validate if "תאריך" field has invalid value with message "שדה חובה" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then Validate if "שעת התחלה" field has invalid value with message "שדה חובה" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then Validate if "שעת סיום" field has invalid value with message "שדה חובה" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then Validate if "מספר אנשי צוות" field has invalid value with message "שדה חובה" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then Validate if "שם האתר" field has invalid value with message "שדה חובה" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then Validate if "כתובת" field has invalid value with message "שדה חובה" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then Validate if "חסימת כביש" field has invalid value with message "שדה חובה" in table "פרטי המיקום ומועדי הצילומים" at index "1"
    Then Validate if "האם יש חיבור לחשמל/גנרטור" field has invalid value with message "שדה חובה"
    Then Validate if "פירוט שימוש באמצעי הפקה, אפקטים שונים (כגון ירי/פיצוץ)" field has invalid value with message "שדה חובה"
    Then Validate if "פירוט ציוד צילום" field has invalid value with message "שדה חובה"