Feature: Basic Test for Parking form, Page 1, [Yes] option

- Feature file name: Parking_pages1_YES.feature
- Form link: https://jeronlineforms-test.jerweb.jer/Parking
- Number of Pages is : 5, We are at Page: 1
- The first Page of this form has two options, [Yes] and [No], we should choose one of them to
  be able to fill the form, each option has different fields.
- In this page we will check all the fields that appear to us after pressing YES Button

# Test header
  Scenario: Explanation field
    # Check if explanation field is existed with minumum characters 50, and validate it
    Given Navigate to "Parking" Page
    Then Validate if "explanation_field" text equals to "explanation_parking"
    # "explanation_parking" value should be taken from constants file

  Scenario: Page number Icon test
    Given Navigate to "Parking" Page
    Then Validate if page number "1" is highlighted

# form fields tests
  Scenario: Pressing No Button
    Given Navigate to "Parking" Page
    When Press on "לא" button
    Then Validate if color of "לא" button is highlighted
    And Validate if "לא" button is pressed
    And Validate if "כן" Button is NOT pressed
    And Validate if color of "כן" button is NOT highlighted

Scenario: Pressing Yes Button
    Given Navigate to "Parking" Page
    When Press on "כן" button
    Then Validate if color of "כן" button is highlighted
    And Validate if "כן" button is pressed
    And Validate if "לא" Button is NOT pressed
    And Validate if color of "לא" button is NOT highlighted

# Checking the Identity number field
  Scenario: I.D. Number test with valid Value
    Given Navigate to "Parking" Page
    When Click on "תעודת זהות" field
    And Clear "תעודת זהות" field
    And Fill "תעודת זהות" field with "039886544"
    Then Validate if "תעודת זהות" field has valid value

  Scenario: I.D. Number test with invalid Value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "תעודת זהות" field
    And Clear "תעודת זהות" field
    And Fill "תעודת זהות" field with " "
    Then Validate if "תעודת זהות" field has invalid value
    And Validate if "תעודת זהות" field has "שדה חובה" alert

  Scenario Outline: I.D. Number test with invalid Values (Only Numbers)
    Given Navigate to "Parking" Page
    When Click on "תעודת זהות" field
    And Clear "תעודת זהות" field
    And Fill "תעודת זהות" field with "<Text>"
    Then Validate if "תעודת זהות" field has invalid value
    And Validate if "תעודת זהות" field has "מספר זהות לא תקין" alert
    When Clear "תעודת זהות" field
    Examples:
      |Text|
      |000000000|
      |000000009|
      |000000018|
      |0        |
      |01       |
      |012      |
      |0123     |
      |01234    |
      |012345   |
      |0123456  |
      |01234567 |
      |012345678|

  Scenario Outline: I.D. Number test with invalid Values (Numbers and Symbols or letters)
    Given Navigate to "Parking" Page
    When Click on "תעודת זהות" field
    And Clear "תעודת זהות" field
    And Fill "תעודת זהות" field with "<Text>"
    Then Validate if "תעודת זהות" field has invalid value
    And Validate if "תעודת זהות" field has "מספר זהות לא תקין" alert
    And Validate if "תעודת זהות" field has "יש להזין ספרות בלבד" alert
    When Clear "תעודת זהות" field
    Examples:
      |Text|
      |a        |
      |א        |
      |ا        |
      |-        |
      |.        |
      |1/1/1/1/1|
      |@11111111|
      |11111111.|
      |a12345678|
      |12345678a|
      |123456789|
      |03988654a|
      |03988654-|
      |-03988644|

# Checking the Date field
  Scenario Outline: Date test with valid values
    Given Navigate to "Parking" Page
    When Click on "תאריך לידה" field
    And Clear "תאריך לידה" field
    And Fill "תאריך לידה" field with "<Date>"
    Then Validate if "תאריך לידה" field has valid value
    Examples:
    |Date|
    |12/12/1988|
    |04/05/2000|
    |04042005  |
    |04-04-2000|
    |04/04.2000|
    |24/12/2001|
    |3012/2000 |

  Scenario: Date test with invalid value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "תאריך לידה" field
    And Clear "תאריך לידה" field
    And Fill "תאריך לידה" field with "  "
    Then Validate if "תאריך לידה" field has invalid value
    And Validate if "תאריך לידה" field has "שדה חובה" alert

  Scenario Outline: Date test with invalid values (Only Numbers)
    Given Navigate to "Parking" Page
    When Click on "תאריך לידה" field
    And Clear "תאריך לידה" field
    And Fill "תאריך לידה" field with "<Text>"
    Then Validate if "תאריך לידה" field has invalid value
    And Validate if "תאריך לידה" field has "?????מספר זהות לא תקין" alert
    Examples:
      |Text|
      |1        |
      |11       |
      |111      |
      |1111     |
      |11111    |
      |20201989 |
      |40402000 |
      |40101000 |
      |0123456  |

  Scenario Outline: Date test with invalid values (Numbers and Symbols or letters)
    Given Navigate to "Parking" Page
    When Click on "תאריך לידה" field
    And Clear "תאריך לידה" field
    And Fill "תאריך לידה" field with "<Text>"
    Then Validate if "תאריך לידה" field has invalid value
    And Validate if "תאריך לידה" field has "????מספר זהות לא תקין" alert
    And Validate if "תאריך לידה" field has "יש להזין ספרות בלבד" alert
    Examples:
      |Text|
      |a       |
      |א       |
      |ا       |
      |-       |
      |.       |
      |1/1/1/1/|
      |@1111111|
      |-1111111|
      |a1234567|
      |1235678a|
      |12456789|
      |0988654a|
      |0988654-|
      |-0988644|