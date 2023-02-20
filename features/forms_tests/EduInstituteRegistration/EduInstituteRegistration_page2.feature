Feature: Testing and validation according to municipality requests list.
  Information about the form:
  - Form title: רישום למוסד לימודי
  - Feature file name: EduInstituteRegistration_page2.feature
  - Form link: https://jeronlineforms.jerweb.jer/EduInstituteRegistration
  - Number of Pages is : 5, We are at Page: 2
  - All fields are mandatory.
  Notes:
  - In this form, all numeric fields accepts only numbers, and doesn't take letters or characters at all.

# Test header
  @Header
  @Critical
  Scenario: Explanation field
    # Check if explanation field is existed with minumum characters 50, and validate it
    Given Navigate to "EduInstituteRegistration" Page
    Then Validate if "explanation_fields" text greater than "50" characters
    And Validate if "explanation_field" text equals to "explanation_EduInstituteRegistration"
    # "explanation_EduInstituteRegistration" value should be taken from constants file

  @Header
  @Critical
  Scenario: Page number Icon test
    Given Navigate to "EduInstituteRegistration" Page
    Then Validate if we are at page number "2"

# check and validate values stored from previous form page "1"
  Scenario: Check values if brought correctly
    Given Navigate to "EduInstituteRegistration" Page 2
    Then Validate if value in "זהות" field equals to "344567482"
    Then Validate if value in "סוג זהות" field equals to "תעודת זהות"
    Then Validate if value in "שם פרטי" field equals to "עומר"
    Then Validate if value in "שם משפחה" field equals to "קימרי"
    Then Validate if value in "תאריך לידה" field equals to "13/03/2018"
    Then Validate if value in "כתובת" field equals to "אמרו אל קיס 61 ירושלים"

  Scenario: ארץ לידה field test
    Given Navigate to "EduInstituteRegistration" Page 2
    When Click on "ארץ לידה" field
    And Fill "ארץ לידה" field with "ישראל"
    And Click on "ישראל"
    Then Validate "ישראל" if correctly displayed in "ארץ לידה" field

  Scenario: click on edit address link
    Given Navigate to "EduInstituteRegistration" Page 2
    When Click on "אני מבקש/ת שינוי כתובת לשנת לימודים" link
    When Click on "תשפ"ד- שנה הבאה" button
    Then Validate if color of "תשפ"ד- שנה הבאה" button is highlighted
    And Validate if "תשפ"ד- שנה הבאה" button is pressed
    When Click on "תשפ"ג- שנה נוכחית" button
    Then Validate if color of "תשפ"ג- שנה נוכחית" button is highlighted
    And Validate if "תשפ"ג- שנה נוכחית" button is pressed

  Scenario: Check "רחוב" dropdown field
    Given Navigate to "EduInstituteRegistration" Page 2
    When We click on "רחוב" field
    And Fill "רחוב" search field with "אבו אלעלא אל מערי"
    And Click on "אבו אלעלא אל מערי"
    Then validate "אבו אלעלא אל מערי" if correctly displayed in "רחוב" dropdown field

 Scenario Outline: House "בית" number test with valid Value
    Given Navigate to "EduInstituteRegistration" Page 2
    When Click on "בית" field
    And Clear "בית" field
    And Fill "בית" field with "<number>"
    Then Validate if "בית" field has valid value
    Examples:
      | number | comment                                             |
      | 01     |                                                     |
      | 1234   |                                                     |
      | 3a1234 | It will accept the number values, it writes "31234" |
      | 11-11  | It will accept the number values, it writes "1111"  |

  @Form
  @Critical

 Scenario Outline: apartment "דירה" number test with valid Value
    Given Navigate to "EduInstituteRegistration" Page 2
    When Click on "דירה" field
    And Clear "דירה" field
    And Fill "דירה" field with "<number>"
    Then Validate if "דירה" field has valid value
    Examples:
      | number | comment                                             |
      | 01     |                                                     |
      | 1234   |                                                     |
      | 3a1234 | It will accept the number values, it writes "31234" |
      | 11-11  | It will accept the number values, it writes "1111"  |

 Scenario: Fill correct values and edit the address
    Given Navigate to "EduInstituteRegistration" Page 2
    When We click on "רחוב" field
    And Fill "רחוב" search field with "אבו אלעלא אל מערי"
    And Click on "אבו אלעלא אל מערי"
   When Click on "בית" field
    And Clear "בית" field
    And Fill "בית" field with "33"
    When Click on "דירה" field
    And Clear "דירה" field
    And Fill "דירה" field with "2"
    And click on "עדכן כתובת" button
    Then Validate if value in "כתובת" field equals to "אבו אלעלא אל מערי 33 ירושלים"

 Scenario: #Todo : תשפ"ד- שנה הבאה


 Scenario: Check "שפת דיבור" dropdown field with search field
    Given Navigate to "EduInstituteRegistration" Page 2
    When We click on "שפת דיבור" field
    And Fill "שפת דיבור" search field with "ערבית"
    And Click on "ערבית"
    Then validate "ערבית" if correctly displayed in "שפת דיבור" dropdown field

 Scenario: Check "קופת חולים" dropdown field with search field
    Given Navigate to "EduInstituteRegistration" Page 2
    When We click on "קופת חולים" field
    And Fill "קופת חולים" search field with "ערבית"
    And Click on "מאוחדת"
    Then validate "ערבית" if correctly displayed in "קופת חולים" dropdown field

 Scenario: Pressing Yes Button
    Given Navigate to "EduInstituteRegistration" Page 2
    When Press on "כן" button at "מגבלות רפואיות (אלרגיות, מחלות ולקויות פיזיות)" field
    Then Validate if color of "כן" button is highlighted
    And Validate if "כן" button is pressed
    And Validate if "לא" Button is NOT pressed
    And Validate if color of "לא" button is NOT highlighted

 Scenario: #Todo : when click on yes button, select some values, then add a file
  # Can't do it now ( it will be saved in municipality records), (because it is a production form)

 Scenario: Pressing Yes Button
    Given Navigate to "EduInstituteRegistration" Page 2
    When Press on "כן" button at "מגבלות רפואיות (אלרגיות, מחלות ולקויות פיזיות)" field
    Then Validate if color of "כן" button is highlighted
    And Validate if "כן" button is pressed
    And Validate if "לא" Button is NOT pressed
    And Validate if color of "לא" button is NOT highlighted

Scenario: Pressing "סטטוס משפחתי של ההורים ביחס לילד/ה" parents status
    Given Navigate to "EduInstituteRegistration" Page 2
    When Press on "הורים נשואים" button at "סטטוס משפחתי של ההורים ביחס לילד/ה" field
    Then Validate if color of "הורים נשואים" button is highlighted
    And Validate if "הורים נשואים" button is pressed
    And Validate if "הורים גרושים/פרודים" Button is NOT pressed
    And Validate if color of "הורים גרושים/פרודים" button is NOT highlighted
    And Validate if "הורים רווקים" Button is NOT pressed
    And Validate if color of "הורים רווקים" button is NOT highlighted
    And Validate if "יתום מאחד מהוריו" Button is NOT pressed
    And Validate if color of "יתום מאחד מהוריו" button is NOT highlighted
    And Validate if "הורה יחידני" Button is NOT pressed
    And Validate if color of "הורה יחידני" button is NOT highlighted

# Page 3, Page 4 are the same - I need the pre-production test to continue














