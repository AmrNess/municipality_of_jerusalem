Feature: Testing and validation according to municipality requests list

- Feature file name: Parking_pages1_NO.feature
- Form link: https://jeronlineforms-test.jerweb.jer/Parking
- Number of Pages is : 5, We are at Page: 1 [No]
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
  Scenario Outline: Car number test with valid Value
    Given Navigate to "Parking" Page
    When Click on "מס' רכב" field
    And Clear "מס' רכב" field
    And Fill "מס' רכב" field with "<text>"
    Then Validate if "מס' רכב" field has valid value
    Examples:
    |text|
    |123456|
    |1234567|
    |12345678|

  Scenario: Car Number test with invalid Value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "מס' רכב" field
    And Clear "מס' רכב" field
    And Fill "מס' רכב" field with " "
    Then Validate if "מס' רכב" field has invalid value
    And Validate if "מס' רכב" field has "שדה חובה" alert

  Scenario Outline: Car number test with invalid Values (Only Numbers)
    Given Navigate to "Parking" Page
    When Click on "מס' רכב" field
    And Clear "מס' רכב" field
    And Fill "מס' רכב" field with "<Text>"
    Then Validate if "מס' רכב" field has invalid value
    And Validate if "מס' רכב" field has "מס' רכב לא תקין" alert
    When Clear "מס' רכב" field
    Examples:
      |Text|
      |1|
      |12|
      |123|
      |1234  |
      |12345 |

  Scenario Outline: Car number test with invalid Values (Numbers and Symbols or letters)
    Given Navigate to "Parking" Page
    When Click on "מס' רכב" field
    And Clear "מס' רכב" field
    And Fill "מס' רכב" field with "<Text>"
    Then Validate if "מס' רכב" field has invalid value
    And Validate if "מס' רכב" field has "מס' רכב לא תקין" alert
    And Validate if "מס' רכב" field has "יש להזין ספרות בלבד" alert
    When Clear "מס' רכב" field
    Examples:
      |Text|
      |a        |
      |א        |
      |ا        |
      |-        |
      |.        |
      |1/1/1/1/|
      |@1111111|
      |11111111|
      |20-200-20|
      |0398865-|
      |-0398864|

  Scenario Outline: Car number test with valid Value
    Given Navigate to "Parking" Page
    When Click on "מס' רכב" field
    And Clear "מס' רכב" field
    And Fill "מס' רכב" field with "<text>"
    Then Validate if "מס' רכב" field has valid value
    Examples:
    |text|
    |123456|
    |1234567|
    |12345678|

  Scenario: Car Number test with invalid Value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "מס' רכב" field
    And Clear "מס' רכב" field
    And Fill "מס' רכב" field with " "
    Then Validate if "מס' רכב" field has invalid value
    And Validate if "מס' רכב" field has "שדה חובה" alert

  Scenario Outline: Car number test with invalid Values (Only Numbers)
    Given Navigate to "Parking" Page
    When Click on "מס' רכב" field
    And Clear "מס' רכב" field
    And Fill "מס' רכב" field with "<Text>"
    Then Validate if "מס' רכב" field has invalid value
    And Validate if "מס' רכב" field has "מס' רכב לא תקין" alert
    When Clear "מס' רכב" field
    Examples:
      |Text|
      |1|
      |12|
      |123|
      |1234  |
      |12345 |

  Scenario Outline: Car number test with invalid Values (Numbers and Symbols or letters)
    Given Navigate to "Parking" Page
    When Click on "מס' רכב" field
    And Clear "מס' רכב" field
    And Fill "מס' רכב" field with "<Text>"
    Then Validate if "מס' רכב" field has invalid value
    And Validate if "מס' רכב" field has "מס' רכב לא תקין" alert
    And Validate if "מס' רכב" field has "יש להזין ספרות בלבד" alert
    When Clear "מס' רכב" field
    Examples:
      |Text|
      |a        |
      |א        |
      |ا        |
      |-        |
      |.        |
      |1/1/1/1/|
      |@1111111|
      |11111111|
      |20-200-20|
      |0398865-|
      |-0398864|

# Checking מס' דוח field
  Scenario Outline: Ticket number test with valid Value
    Given Navigate to "Parking" Page
    When Click on "מס' דוח" field
    And Clear "מס' דוח" field
    And Fill "מס' דוח" field with "<text>"
    Then Validate if "מס' דוח" field has valid value
    Examples:
    |text|
    |123456|
    |1234567|

  Scenario: Ticket number test with invalid Value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "מס' דוח" field
    And Clear "מס' דוח" field
    And Fill "מס' דוח" field with " "
    Then Validate if "מס' דוח" field has invalid value
    And Validate if "מס' דוח" field has "שדה חובה" alert

  Scenario Outline: Ticket number test with invalid Values (Only Numbers)
    Given Navigate to "Parking" Page
    When Click on "מס' דוח" field
    And Clear "מס' דוח" field
    And Fill "מס' דוח" field with "<Text>"
    Then Validate if "מס' דוח" field has invalid value
    And Validate if "מס' דוח" field has "מס' דוח לא תקין" alert
    When Clear "מס' דוח" field
    Examples:
      |Text|
      |1|
      |12|
      |123|
      |1234  |
      |12345 |
      |12345678|

  Scenario Outline: Ticket number test with invalid Values (Numbers and Symbols or letters)
    Given Navigate to "Parking" Page
    When Click on "מס' דוח" field
    And Clear "מס' דוח" field
    And Fill "מס' דוח" field with "<Text>"
    Then Validate if "מס' דוח" field has invalid value
    And Validate if "מס' דוח" field has "מס' דוח לא תקין" alert
    And Validate if "מס' דוח" field has "יש להזין ספרות בלבד" alert
    When Clear "מס' דוח" field
    Examples:
      |Text|
      |a        |
      |א        |
      |ا        |
      |-        |
      |.        |
      |1/1/1/1/|
      |@1111111|
      |11111111|
      |20-200-20|
      |0398865-|
      |-0398864|

# First Name Field
  Scenario Outline: First Name test with valid Value
    Given Navigate to "Parking" Page
    When Click on "שם פרטי" field
    And Clear "שם פרטי" field
    And Fill "שם פרטי" field with "<text>"
    Then Validate if "שם פרטי" field has valid value
    Examples:
    |text|
    |דרוויש|
    |דרוויש נאסיר|
    |דרוויש.קימרי|
    |דרוויש-קימרי|
    |דרוויש/קימרי|
    |דרוויש(קימרי|
    |דרוויש)קימרי|
    |דרוויש'קימרי|
    |דרוויِש"קימרי|
    |דרוויש_קימרי|
    |דרוויש,קימרי|
    |דחכלמהלגחכלמהלגלכחהמגלכחמהלגחכמהלגחכמהלגחכמהלגחכמ|


  Scenario: First Name test with invalid Value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "שם פרטי" field
    And Clear "שם פרטי" field
    And Fill "שם פרטי" field with " "
    Then Validate if "שם פרטי" field has invalid value
    And Validate if "שם פרטי" field has "שדה חובה" alert

  Scenario Outline: First Name test with invalid Values (Numbers, letters and special characters)
    Given Navigate to "Parking" Page
    When Click on "שם פרטי" field
    And Clear "שם פרטי" field
    And Fill "שם פרטי" field with "<Text>"
    Then Validate if "שם פרטי" field has invalid value
    And Validate if "שם פרטי" field has "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -" alert
    When Clear "שם פרטי" field
    Examples:
      |Text|
    |1דרוויש|
    |דרוויש@נאסיר|
    |דרוויש#קימרי|
    |דרוויש$קימרי|
    |דרוויש%קימרי|
    |דרוויש^קימרי|
    |דרוויש&קימרי|
    |דרוויש*קימרי|
    |darweesh|
    |1234567|
    |درويش|

# Family Name Field
  Scenario Outline: Family Name test with valid Value
    Given Navigate to "Parking" Page
    When Click on "שם משפחה" field
    And Clear "שם משפחה" field
    And Fill "שם משפחה" field with "<text>"
    Then Validate if "שם משפחה" field has valid value
    Examples:
    |text|
    |דרוויש|
    |דרוויש נאסיר|
    |דרוויש.קימרי|
    |דרוויש-קימרי|
    |דרוויש/קימרי|
    |דרוויש(קימרי|
    |דרוויש)קימרי|
    |דרוויש'קימרי|
    |דרוויِש"קימרי|
    |דרוויש_קימרי|
    |דרוויש,קימרי|
    |דחכלמהלגחכלמהלגלכחהמגלכחמהלגחכמהלגחכמהלגחכמהלגחכמ|


  Scenario: Family Name test with invalid Value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "שם משפחה" field
    And Clear "שם משפחה" field
    And Fill "שם משפחה" field with " "
    Then Validate if "שם משפחה" field has invalid value
    And Validate if "שם משפחה" field has "שדה חובה" alert

  Scenario Outline: Family Name test with invalid Values (Numbers, letters and special characters)
    Given Navigate to "Parking" Page
    When Click on "שם משפחה" field
    And Clear "שם משפחה" field
    And Fill "שם משפחה" field with "<Text>"
    Then Validate if "שם משפחה" field has invalid value
    And Validate if "שם משפחה" field has "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -" alert
    When Clear "שם משפחה" field
    Examples:
      |Text|
    |1דרוויש|
    |דרוויש@נאסיר|
    |דרוויש#קימרי|
    |דרוויש$קימרי|
    |דרוויש%קימרי|
    |דרוויש^קימרי|
    |דרוויש&קימרי|
    |דרוויש*קימרי|
    |darweesh|
    |1234567|
    |درويش|


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