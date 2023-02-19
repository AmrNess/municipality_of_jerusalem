Feature: Testing confirmation for structure page FORM 3 ONLY

  - Feature file name: confirmation_test_from3.feature
  - Form link: https://jeronlineforms-test.jerweb.jer/ConfirmationForStructure
  - Number of Pages is : 3, We are at Page: 3
  - All fields are optional except street and house number block and plot.


  @minor
  @header
  Scenario: check all the header components are displayed and correct
    Given I navigate to "ConfirmationForStructure" page
    Then I check if the header and is displayed
    Then I check if the header "logo" ins displayed
    Then I check if the header "Title" is displayed and have more than "5" character
    Then I check if the header language "hebrew" button is clickable
    Then I check if the header language "arabic" button is clickable
    Then I check that this form is form number "3"

  @minor
  @footer
   Scenario: check if footer is displayed and have text
   Given I navigate to "ConfirmationForStructure" page
   Then I check if the footer is displayed and have more than 10 character


   @minor
   @form
   Scenario: check if the signup link in the form works
   Given I navigate to "ConfirmationForStructure" page
   When I click the link that have text "להרשמה"
   Then The new opened tab should include "ירושלמי" in title


   @minor
   @savebutton
   @popup
   Scenario: check if save content button shows popup after clicking it
   Given I navigate to "ConfirmationForStructure" page
   Then I check that this form is form number "3"
   Then I check if i click "שמור טיוטה" a popup with title "שמור טיוטה" is displayed
   Then check if popup "שמור טיוטה" text have more than "10" characters
   Then I click close button of popup "שמור טיוטה"
   Then check if popup "שמור טיוטה" is not diplayed

   @minor
   @savebutton
   @popup
   Scenario: check if save content button shows popup after clicking it
   Given I navigate to "ConfirmationForStructure" page
   Then I check that this form is form number "3"
   Then I check if i click "שמור טיוטה" a popup with title "שמור טיוטה" is displayed
   Then at the popup "שמור טיוטה" click button "שמור טיוטה"
   Then I check that this form is form number "2"

   @critical
   Scenario:  check if the text of the form have what i entered in form 2
   Given I navigate to "ConfirmationForStructure" page
   Then I check that this form is form number "3"
   Then I check if the line that have text "הנכס עליו ביקשת מידע הוא" entered values in form "2"


   @minor
   Scenario:  check if the checkbox works as intended
   Given I navigate to "ConfirmationForStructure" page
   Then I click on the check box that starts with text "אני מודע/ת ומסכים/ה"
   Then I check if the check box that starts with text "אני מודע/ת ומסכים/ה" is checked
   Then I click on the check box that starts with text "אני מודע/ת ומסכים/ה"
   Then I check if the check box that starts with text "אני מודע/ת ומסכים/ה" is unchecked

   @minor
   @sendbutton
   @popup
   Scenario: check if save content button shows popup after clicking it
   Given I navigate to "ConfirmationForStructure" page
   Then I check that this form is form number "3"
   Then I check if i click "שלח" a popup with title "אישור שליחה" is displayed
   Then check if popup "אישור שליחה" text have more than "10" characters
   Then check if popup "אישור שליחה" text includes text "שים לב! בשליחה - הטופס ינעל לשינויים"
   Then I click close button of popup "אישור שליחה"
   Then check if popup "אישור שליחה" is not diplayed
