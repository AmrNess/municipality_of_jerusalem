Feature: Testing photo permission page FORM 4 ONLY

  - Feature file name: photo_permission_test_form4.feature
  - Form link: https://jeronlineforms-test.jerweb.jer/PhotoPermission
  - Number of Pages is : 4, We are at Page: 4
  - All fields are mandatory except "העתק ביטוח צד ג'" upload field

  @minor
  @header
  Scenario: explanation is displayed
    Given I navigate to "PhotoPermission" page
    Then I check if the header and is displayed
    Then I check if the header "logo" ins displayed
    Then I check if the header "Title" is displayed and have more than "5" character
    Then I check that this form is form number "4"

  @minor
  @footer
   Scenario: check if footer is displayed and have text
   Given I navigate to "PhotoPermission" page
   Then I check if the footer is displayed and have more than 10 character

  @minor
  @form
  Given Navigate to "FreedomInfo" Page 4
  When Click on "הוסף קובץ" button from "צילום ת.ז. / דרכון" field
  And Select file using pyautogui module
  And Click open using pyautogui module
  Then Validate "filename.jpg" equals to "filename.jpg" from "צילום ת.ז. / דרכון" field
  And Validate if "filename.jpg" size is less then "6000kb" from "צילום ת.ז. / דרכון"  field
  Then Validate if "צילום ת.ז. / דרכון"  field has invalid value
  And Validate if "צילום ת.ז. / דרכון"  alert equals to ""סוג הקובץ אינו חוקימותרים קבצים מסוג זה בלבד: .bmp, .gif, .png, .jpg, .jpeg, .pdf""

  @minor
  @form
  Given Navigate to "FreedomInfo" Page 4
  When Click on "הוסף קובץ" button from "כתב התחייבות" field
  And Select file using pyautogui module
  And Click open using pyautogui module
  Then Validate "filename.jpg" equals to "filename.jpg" from "כתב התחייבות" field
  And Validate if "filename.jpg" size is less then "6000kb" from "כתב התחייבות"  field
  Then Validate if "כתב התחייבות" field has invalid value
  And Validate if "כתב התחייבות"  alert equals to ""סוג הקובץ אינו חוקימותרים קבצים מסוג זה בלבד: .bmp, .gif, .png, .jpg, .jpeg, .pdf""

  @minor
  @form
  Given Navigate to "FreedomInfo" Page 4
  When Click on "הוסף קובץ" button from "העתק ביטוח צד ג'" field
  And Select file using pyautogui module
  And Click open using pyautogui module
  Then Validate "filename.jpg" equals to "filename.jpg" from "העתק ביטוח צד ג'" field
  And Validate if "filename.jpg" size is less then "6000kb" from "העתק ביטוח צד ג'"  field
  Then Validate if "העתק ביטוח צד ג'"  field has invalid value
  And Validate if "העתק ביטוח צד ג'"  alert equals to ""סוג הקובץ אינו חוקימותרים קבצים מסוג זה בלבד: .bmp, .gif, .png, .jpg, .jpeg, .pdf""

  @minor
  @form
  Given Navigate to "FreedomInfo" Page 4
  When Click on "הוסף קובץ" button from "סינופסיס קצר" field
  And Select file using pyautogui module
  And Click open using pyautogui module
  Then Validate "filename.jpg" equals to "filename.jpg" from "סינופסיס קצר" field
  And Validate if "filename.jpg" size is less then "6000kb" from "סינופסיס קצר"  field
  Then Validate if "סינופסיס קצר"  field has invalid value
  And Validate if "סינופסיס קצר"  alert equals to ""סוג הקובץ אינו חוקימותרים קבצים מסוג זה בלבד: .bmp, .gif, .png, .jpg, .jpeg, .pdf""


   @minor
   Scenario:  check if the checkbox works as intended
   Given I navigate to "PhotoPermission" page
   Then I click on the check box that starts with text "הריני מצהיר/ה בזה כי כל הפרטים "
   Then I check if the check box that starts with text "הריני מצהיר/ה בזה כי כל הפרטים " is checked
   Then I click on the check box that starts with text "אני מודע/ת ומסכים/ה"
   Then I check if the check box that starts with text "אני מודע/ת ומסכים/ה" is unchecked

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
   @form
   Scenario: check if the signup link in the form works
   Given I navigate to "PhotoPermission" page
   When I click the link that have text "להרשמה"
   Then The new opened tab should include "ירושלמי" in title

   @minor
   @savebutton
   @popup
   Scenario: check if click ing save content button return to same page
   Given I navigate to "PhotoPermission" page
   Then I check that this form is form number "3"
   Then I check if i click "שמור טיוטה" a popup with title "שמור טיוטה" is displayed
   Then at the popup "שמור טיוטה" click button "שמור טיוטה"
   Then I check that this form is form number "3"

  @critical
  @form
  Scenario: verify required upload field that have alert with message "must pick a file"
    Given I navigate to "PhotoPermission" page
    When click on "שלח" button
    Then Validate if "צילום ת.ז. / דרכון" field has invalid value with message "חובה לצרף קובץ"
    Then Validate if "כתב התחייבות" field has invalid value with message "חובה לצרף קובץ"
    Then Validate if "סינופסיס קצר" field has invalid value with message "חובה לצרף קובץ"
