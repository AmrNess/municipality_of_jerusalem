Feature: Testing confirmation for structure page FORM 2 ONLY

  - Feature file name: confirmation_test_from2.feature
  - Form link: https://jeronlineforms-test.jerweb.jer/ConfirmationForStructure
  - Number of Pages is : 3, We are at Page: 2
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
    Then I check that this form is form number "2"

  @minor
  @footer
   Scenario: check if footer is displayed and have text
   Given I navigate to "ConfirmationForStructure" page
   Then I check if the footer is displayed and have more than 10 character

   @minor
   @savebutton
   @popup
   Scenario: check if save content button shows popup after clicking it
   Given I navigate to "ConfirmationForStructure" page
   Then I check that this form is form number "2"
   Then I check if i click "שמור טיוטה" a popup with title "שמור טיוטה" is displayed
   Then check if popup "שמור טיוטה" text have more than "10" characters
   Then check if popup "שמור טיוטה" text includes text "הטופס נשמר כטיוטה ובתוקף עד לתאריך"
   Then I click close button of popup "שמור טיוטה"
   Then check if popup "שמור טיוטה" is not diplayed

   @minor
   @savebutton
   @popup
   Scenario: check if save content button shows popup after clicking it
   Given I navigate to "ConfirmationForStructure" page
   Then I check that this form is form number "2"
   Then I check if i click "שמור טיוטה" a popup with title "שמור טיוטה" is displayed
   Then at the popup "שמור טיוטה" click button "שמור טיוטה"
   Then I check that this form is form number "2"

  @critical
  @form
  Scenario Outline: check the street form (dropdown with search field) only have jerusalem streets (valid values inserted)
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "רחוב" search field
    Then field "רחוב" should have chosen a street that is in jerusalem
    Examples:
    | text |
    |בית חנינא|
    |דרך שועפט|
    |טור|



  @critical
  @form
  Scenario Outline: check the street form (dropdown with search field) only have jerusalem streets (invalid values inserted)
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "רחוב" search field
    Then field "רחוב" should get error "no result found"
    Examples:
    | text |
    |fsdfds|
    |سيبيسبيس|
    |324نت324نمت32|
    |תל אביב|
    |חיברון|


  @critical
  @form
  Scenario Outline: check house number that takes maximum 3 digits
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "מספר בית"
    Then field "מספר בית" should have first "3" digit from the inserted value
    Examples:
    | text |
    |1234567|
    |345    |
    |765432543243|

  @critical
  @form
  Scenario Outline: check house number with invalid values to check the error "numbers only"
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "מספר בית"
    Then field "מספר בית" should have invalid value and with alert "יש להזין ספרות בלבד"
    Examples:
    | text |
    |ab1|
    |12-|
    |1:5|
    |14a|
    |1_5|
    |1.5|
    |12c|
    |e34|
    |1f3|

  @critical
  @form
  Scenario Outline: check house number with invalid values to check the error "invalid value"
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "מספר בית"
    Then field "מספר בית" should have invalid value and with alert "שדה לא תקין"
    Examples:
    | text |
    |000|
    |0$ |


  @critical
  @form
  Scenario Outline: check house number with valid values only
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "מספר בית"
    Then field "מספר בית" should have valid value
    Examples:
    | text |
    |123|
    |654|
    |456|
    |345|
    |987|
    |414|


  @critical
  @form
  Scenario Outline: check apartment number that takes maximum 3 digits
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "מספר דירה"
    Then field "מספר דירה" should have first "3" digit from the inserted value
    Examples:
    | text |
    |1234567|
    |345    |
    |123fdfd|
    |765432543243|

  @critical
  @form
  Scenario Outline: check house number with invalid values to check the error "numbers only"
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "מספר דירה"
    Then field "מספר דירה" should have invalid value and with alert "יש להזין ספרות בלבד"
    Examples:
    | text |
    |ab1|
    |12-|
    |1:5|
    |14a|
    |1_5|
    |1.5|
    |12c|
    |e34|
    |1f3|

  @critical
  @form
  Scenario Outline: check house number with valid values only
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "מספר דירה"
    Then field "מספר דירה" should have valid value
    Examples:
    | text |
    |123|
    |654|
    |456|
    |345|
    |987|
    |414|


  @critical
  @form
  Scenario Outline: check block number that takes maximum 6 digits
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "גוש"
    Then field "גוש" should have first "6" digit from the inserted value
    Examples:
    | text |
    |1234567|
    |3459384843|
    |765432543243|
    |123456|

  @critical
  @form
  Scenario Outline: check block number with invalid values to check the error "numbers only"
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "גוש"
    Then field "גוש" should have invalid value and with alert "יש להזין ספרות בלבד"
    Examples:
    | text |
    |ab23413|
    |12-23432|
    |1:5234|
    |12342344a|
    |1234_5|
    |1.23425|
    |134c11|
    |e354334|
    |1f344333|

  @critical
  @form
  Scenario Outline: check block number with invalid values to check the error "invalid value"
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "גוש"
    Then field "גוש" should have invalid value and with alert "שדה לא תקין"
    Examples:
    | text |
    |000000|
    |0$ |
    |0  |
    |000@00|


  @critical
  @form
  Scenario Outline: check block number with valid values only
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "גוש"
    Then field "גוש" should have valid value
    Examples:
    | text |
    |123|
    |654|
    |456|
    |345|
    |987|
    |414|
    |000100|
    |123456|
    |010223|

  @minor
  @form
  Scenario: check the link under the  block field if it clickable and open the right site
    Given I navigate to "ConfirmationForStructure" page
    When I click the link under "גוש"
    Then The new opened tab should include "איתור גוש" in title


  @critical
  @form
  Scenario Outline: check plot number that takes maximum 6 digits
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "חלקה"
    Then field "חלקה" should have first "6" digit from the inserted value
    Examples:
    | text |
    |1234567|
    |3459384843|
    |765432543243|
    |123456|

  @critical
  @form
  Scenario Outline: check plot number with invalid values to check the error "numbers only"
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "חלקה"
    Then field "חלקה" should have invalid value and with alert "יש להזין ספרות בלבד"
    Examples:
    | text |
    |ab23413|
    |12-23432|
    |1:5234|
    |12342344a|
    |1234_5|
    |1.23425|
    |134c11|
    |e354334|
    |1f344333|

  @critical
  @form
  Scenario Outline: check plot number with invalid values to check the error "invalid value"
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "חלקה"
    Then field "חלקה" should have invalid value and with alert "שדה לא תקין"
    Examples:
    | text |
    |000000|
    |0$ |
    |0  |
    |000@00|


  @critical
  @form
  Scenario Outline: check plot number with valid values only
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "חלקה"
    Then field "חלקה" should have valid value
    Examples:
    | text |
    |123|
    |654|
    |456|
    |345|
    |987|
    |414|
    |000100|
    |123456|
    |010223|


      @critical
  @form
  Scenario Outline: check subplot number that takes maximum 6 digits
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "תת חלקה"
    Then field "תת חלקה" should have first "6" digit from the inserted value
    Examples:
    | text |
    |1234567|
    |3459384843|
    |765432543243|
    |123456|

  @critical
  @form
  Scenario Outline: check subplot number with invalid values to check the error "numbers only"
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "תת חלקה"
    Then field "תת חלקה" should have invalid value and with alert "יש להזין ספרות בלבד"
    Examples:
    | text |
    |ab23413|
    |12-23432|
    |1:5234|
    |12342344a|
    |1234_5|
    |1.23425|
    |134c11|
    |e354334|
    |1f344333|


  @critical
  @form
  Scenario Outline: check subplot number with valid values only
    Given I navigate to "ConfirmationForStructure" page
    When I write "<text>" in "תת חלקה"
    Then field "תת חלקה" should have valid value
    Examples:
    | text |
    |123|
    |654|
    |456|
    |345|
    |987|
    |414|
    |000100|
    |123456|
    |010223|


