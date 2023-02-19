Feature: Basic Test for Parking form, Page 1, [NO] option

- Feature file name: Parking_pages1_NO.feature
- Form link: https://jeronlineforms-test.jerweb.jer/Parking
- Number of Pages is : 5, We are at Page: 1
- All fields are mandatory. (except: Telephone no.)
- The first Page has two options, [Yes] or [No], we should choose one of them to
  be able to fill the form, each option has different fields.
- In this page we will check all the fields that appear to us after pressing [NO] Button

# form fields tests
  Scenario: Pressing No Button
    Given Navigate to "Parking" Page
    When Press on "לא" button
    Then Validate if color of "לא" button is highlighted
    And Validate if "לא" button is pressed
    And Validate if "כן" Button is NOT pressed
    And Validate if color of "כן" button is NOT highlighted

# Checking the Car number field
#BUG: Identity field accepts only numbers, but it allows us to write letters and special characters.
  Scenario: Car number test with valid Value
    Given Navigate to "Parking" Page
    When Click on "" field
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
      |6544     |
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
    |a22/11/a2022|

  Scenario: Date test with invalid value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "תאריך לידה" field
    And Clear "תאריך לידה" field
    And Fill "תאריך לידה" field with "  "
    Then Validate if "תאריך לידה" field has invalid value
    And Validate if "תאריך לידה" field has "שדה חובה" alert
    When Clear "תעודת זהות" field

  Scenario Outline: Date test with invalid values (Only Numbers)
    Given Navigate to "Parking" Page
    When Click on "תאריך לידה" field
    And Fill "תאריך לידה" field with "<Text>"
    Then Validate if "תאריך לידה" field has invalid value
    And Validate if "תאריך לידה" field has "תאריך לא תקין" alert
    When Clear "תעודת זהות" field

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

# Checking street field
  Scenario: Street test dropdown menu
    Given Navigate to "Parking" Page
    When We click on "רחוב" field
    And Fill "רחוב" search field with "אבו אלעלא אל מערי"
    And Click on "אבו אלעלא אל מערי"
    Then validate "אבו אלעלא אל מערי" if correctly displayed

  Scenario: Street test dropdown menu (Scroll method)
    Given Navigate to "Parking" Page
    When We click on "רחוב" field
    And Scroll "רחוב" search field until "אבו אלעלא אל מערי" appear
    Then validate "אבו אלעלא אל מערי" with shown result in search field
    And Validate text under "רחוב" field with "יש להזין כתובת רשימת המופיעה בתעודת הזהות"

  Scenario: Street test check test bellow field
    Given Navigate to "Parking" Page
    Then Validate text under "רחוב" field with "יש להזין כתובת רשימת המופיעה בתעודת הזהות"

  Scenario: Street test dropdown menu
    Given Navigate to "Parking" Page
    When We click on "רחוב" field
    And Fill "רחוב" search field with "text in english"
    Then validate "לא נמצאו תוצאות" with shown text under search field

# Test house number field
# BUG: Maximum allowed characters is 15, and that is too much for a house number
  Scenario Outline: House number test with valid Value
    Given Navigate to "Parking" Page
    When Click on "מספר בית" field
    And Clear "מספר בית" field
    And Fill "מספר בית" field with "<number>"
    Then Validate if "מספר בית" field has valid value
    Examples:
    |number| comment |
    |01    |         |
    |1234  |         |
    |3a1234|It will accept the number values, it writes "31234"|
    |11-11 |It will accept the number values, it writes "1111"|

  Scenario: House number test with invalid Value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "מספר בית" field
    And Clear "מספר בית" field
    And Fill ""מספר בית" field with " "
    Then Validate if "מספר בית" field has invalid value
    And Validate if "מספר בית" field has "שדה חובה" alert

 # Email field test
  Scenario: Email test with valid Value
    Given Navigate to "Parking" Page
    When Click on "דוא"ל" field
    And Clear "דוא"ל" field
    And Fill "דוא"ל" field with "darweeshq@gmail.com"
    Then Validate if "דוא"ל" field has valid value

  Scenario: Email test with invalid Value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "דוא"ל" field
    And Clear "דוא"ל" field
    And Fill "דוא"ל" field with " "
    Then Validate if "דוא"ל" field has invalid value
    And Validate if "דוא"ל" field has "שדה חובה" alert


  Scenario Outline: Email test with invalid Values (Numbers and Symbols or letters)
    Given Navigate to "Parking" Page
    When Click on "דוא"ל" field
    And Clear "דוא"ל" field
    And Fill "דוא"ל" field with "<Text>"
    Then Validate if "דוא"ל" field has invalid value
    And Validate if "דוא"ל" field has "שדה לא תקין" alert
    When Clear "דוא"ל" field
    Examples:
      |Text|
      |0        |
      |abc      |
      |גגגג     |
      |01234567 |
      |darweesh.|
      |.com     |
      |@.com    |
      |.@.com    |
      |email#example.com|
      |email address@example.com|
      |.email@example.com       |
      |e..mail@example.com      |
      |email@example            |

 # Test Cellphone field
  Scenario: Cellphone suffix test with valid Value
    Given Navigate to "Parking" Page
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with "5768719"
    Then Validate if "טלפון נייד" field has valid value

  Scenario: Cellphone test with invalid Value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with " "
    Then Validate if "טלפון נייד" field has invalid value
    And Validate if "טלפון נייד" field has "שדה חובה" alert

  Scenario Outline: Cellphone test with invalid Values (Only Numbers)
    Given Navigate to "Parking" Page
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with "<Text>"
    Then Validate if "טלפון נייד" field has invalid value
    And Validate if "טלפון נייד" field has "יש להשלים את הספרות החסרות" alert
    When Clear "טלפון נייד" field
    Examples:
      |Text|
      |0        |
      |01       |
      |012      |
      |0123     |
      |01234    |
      |012345   |
      |0123456  |

  Scenario Outline: Cellphone test with invalid Values (Numbers and Symbols or letters)
    # In this scenario, two red label appears (complete the missing numbers, only numbers accepted)
    Given Navigate to "Parking" Page
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with "<Text>"
    Then Validate if "טלפון נייד" field has invalid value
    And Validate if "טלפון נייד" field has "יש להזין ספרות בלבד" alert
    And Validate if "טלפון נייד" field has "יש להשלים את הספרות החסרות" alert
    When Clear "טלפון נייד" field
    Examples:
      |Text|
      |abcd     |
      |א        |
      |ا        |
      |-        |
      |.        |
      |ש12345   |
      |@12345   |
      |333 33   |

     Scenario Outline: Cellphone test with invalid Values (Numbers and Symbols or letters)
    Given Navigate to "Parking" Page
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with "<Text>"
    Then Validate if "טלפון נייד" field has invalid value
    And Validate if "טלפון נייד" field has "מספר לא תקין" alert
    When Clear "טלפון נייד" field
    Examples:
      |Text|
      |a12345678|
      |ששששששש|
      |ششششششش|
      |aaaaaaa|
      |03988654-|
      |-03988644|

# Test Cellphone prefix
  Scenario Outline: Cellphone prefix test
    Given Navigate to "Parking" Page
    When Click on "pre_cellphone" field
    And Fill "pre_cellphone" field with "<num>"
    And Click on "<num>"
    Then Validate "pre_cellphone"if correctly displayed
    Examples:
      |num|
      |050|
      |051|
      |052|
      |053|
      |054|
      |055|
      |056|
      |057|
      |058|
      |059|
      |077|

# Send message to test button
  Scenario: Pressing Cellphone Button
    Given Navigate to "Parking" Page
    When Press on "Cellphone" button
    Then Validate if color of "Cellphone" button is highlighted
    And Validate if "Cellphone" button is pressed
    And Validate if "Email" Button is NOT pressed
    And Validate if color of "Email" button is NOT highlighted

 Scenario: Pressing Email Button
    Given Navigate to "Parking" Page
    When Press on "Email" button
    Then Validate if color of "Email" button is highlighted
    And Validate if "Email" button is pressed
    And Validate if "Cellphone" Button is NOT pressed
    And Validate if color of "Cellphone" button is NOT highlighted

 Scenario: Press continue button with valid test (Fill all fields with correct values)
    Given Navigate to "Parking" Page
    When Click on "תעודת זהות" field
    And Clear "תעודת זהות" field
    And Fill "תעודת זהות" field with "039886544"
    When Click on "תאריך לידה" field
    And Clear "תאריך לידה" field
    And Fill "תאריך לידה" field with "04051983"
    When We click on "רחוב" field
    And Fill "רחוב" search field with "אבו אלעלא אל מערי"
    And Click on "אבו אלעלא אל מערי"
    When Click on "מספר בית" field
    And Clear "מספר בית" field
    And Fill "מספר בית" field with "61"
    When Click on "דוא"ל" field
    And Clear "דוא"ל" field
    And Fill "דוא"ל" field with "darweeshq@gmail.com"
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with "5768719"
    When Click on "pre_cellphone" field
    And Fill "pre_cellphone" field with "052"
    And Click on "052"
    When Press on "Email" button
    When Press on "המשך" button
    Then Validate if page number "2" is highlighted
    #We can validate from page number

  Scenario: Press continue button with invalid test (Fill all fields correct values except I.D)
    Given Navigate to "Parking" Page
    When Click on "תעודת זהות" field
    And Clear "תעודת זהות" field
    And Fill "תעודת זהות" field with "000"
    #Invalid I.D number
    When Click on "תאריך לידה" field
    And Clear "תאריך לידה" field
    And Fill "תאריך לידה" field with "04051983"
    When We click on "רחוב" field
    And Fill "רחוב" search field with "אבו אלעלא אל מערי"
    And Click on "אבו אלעלא אל מערי"
    When Click on "מספר בית" field
    And Clear "מספר בית" field
    And Fill "מספר בית" field with "61"
    When Click on "דוא"ל" field
    And Clear "דוא"ל" field
    And Fill "דוא"ל" field with "darweeshq@gmail.com"
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with "5768719"
    When Click on "pre_cellphone" field
    And Fill "pre_cellphone" field with "052"
    And Click on "052"
    When Press on "Email" button
    When Press on "המשך" button
    Then Validate if page number "1" is highlighted
    #We can validate from page number

 Scenario: Press continue button with invalid test (Fill all fields correct values except Date of Birth)
    Given Navigate to "Parking" Page
    When Click on "תעודת זהות" field
    And Clear "תעודת זהות" field
    And Fill "תעודת זהות" field with "039886544"
    When Click on "תאריך לידה" field
    And Clear "תאריך לידה" field
    And Fill "תאריך לידה" field with "040583"
    #Invalid date
    When We click on "רחוב" field
    And Fill "רחוב" search field with "אבו אלעלא אל מערי"
    And Click on "אבו אלעלא אל מערי"
    When Click on "מספר בית" field
    And Clear "מספר בית" field
    And Fill "מספר בית" field with "61"
    When Click on "דוא"ל" field
    And Clear "דוא"ל" field
    And Fill "דוא"ל" field with "darweeshq@gmail.com"
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with "5768719"
    When Click on "pre_cellphone" field
    And Fill "pre_cellphone" field with "052"
    And Click on "052"
    When Press on "Email" button
    When Press on "המשך" button
    Then Validate if page number "1" is highlighted
    #We can validate from page number