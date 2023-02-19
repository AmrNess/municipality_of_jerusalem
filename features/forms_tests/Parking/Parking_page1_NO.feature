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

# family name field
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

# סוג זיהוי dropdown menu
  #pick option from סוג זיהוי
  Scenario Outline: pick option from סוג זיהוי
    Given Navigate to "Parking" Page
    When Click on "סוג זיהוי" field
    And choose "<option>" field with "סוג זיהוי"
    And Click on "<option>"
    Then Validate "<option>" if correctly displayed
    Examples:
    |option|
    | ת.ז.|
    | דרכון|
    | ח.פ.|
    | ח.פ. של חברה|
    |אחר      |

  #pick ת.ז. from סוג זיהוי
  Scenario: pick ת.ז. from סוג זיהוי and fill ת.ז. with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זיהוי" field
    And choose "ת.ז." field from "סוג זיהוי"
    And Click on "ת.ז."
    When Click on "מספר ת.ז." field
    And Clear "מספר ת.ז." field
    And Fill "מספר ת.ז." field with "039886544"

   Scenario Outline: pick ת.ז. from סוג זיהוי and fill ת.ז. with invalid value (Only numbers)
    Given Navigate to "Parking" Page
    When Click on "סוג זיהוי" field
    And choose "ת.ז." field from "סוג זיהוי"
    And Click on "ת.ז."
    When Click on "מספר ת.ז." field
    And Clear "מספר ת.ז." field
    And Fill "מספר ת.ז." field with "<num>"
    Then Validate if "מספר ת.ז." field has invalid value
    And Validate if "מספר ת.ז." field has "מספר זהות לא תקין" alert
    And Clear "מספר ת.ז." field
    Examples:
      |num|
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

 Scenario Outline: pick ת.ז. from סוג זיהוי and fill ת.ז. with invalid value (Numbers and text)
    Given Navigate to "Parking" Page
    When Click on "סוג זיהוי" field
    And choose "ת.ז." field from "סוג זיהוי"
    And Click on "ת.ז."
    When Click on "מספר ת.ז." field
    And Clear "מספר ת.ז." field
    And Fill "מספר ת.ז." field with "<text>"
    Then Validate if "מספר ת.ז." field has invalid value
    And Validate if "מספר ת.ז." field has "מספר זהות לא תקין" alert
    And Clear "מספר ת.ז." field
    Examples:
      |text|
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

 #pick דרכון from סוג זיהוי
  Scenario Outline: pick דרכון from סוג זיהוי and fill ת.ז. with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זיהוי" field
    And choose "דרכון" field from "סוג זיהוי"
    And Click on "דרכון"
    When Click on "מספר דרכון" field
    And Clear "מספר דרכון" field
    And Fill "מספר דרכון" field with "<num>"
    Then Validate if "מספר דרכון" field has valid value
    Examples:
    |num|
    |IS0123456789|
    |IS123456789012345678|
    |0123456789          |

  Scenario Outline: pick דרכון from סוג זיהוי and fill ת.ז. with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זיהוי" field
    And choose "דרכון" field from "סוג זיהוי"
    And Click on "דרכון"
    When Click on "מספר דרכון" field
    And Clear "מספר דרכון" field
    And Fill "מספר דרכון" field with "<num>"
    Then Validate if "מספר דרכון" field has invalid value
    And Validate if "מספר דרכון" field has "מספר דרכון לא תקין" alert
    Examples:
    |num|
    |00000000000!|
    |0000000000012@|
    |אבגד|
    |abc----123445|
    |===          |
    |@            |
    |abcdefg      |
    |abcdefghIjk1 |
    |00000000     |
    |a            |
    |1            |

 #pick  ח.פ. from סוג זיהוי
  Scenario Outline: pick  ח.פ.   from סוג זיהוי and fill ת.ז. with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זיהוי" field
    And choose "ח.פ." field from "סוג זיהוי"
    And Click on "ח.פ."
    When Click on "מספר ח.פ." field
    And Clear "מספר ח.פ." field
    And Fill "מספר ח.פ." field with "<num>"
    Then Validate if "מספר ח.פ." field has valid value
    Examples:
    |num|
    |12345678|

  Scenario Outline: pick  ח.פ.  from סוג זיהוי and fill ת.ז. with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זיהוי" field
    And choose "ח.פ." field from "סוג זיהוי"
    And Click on "ח.פ."
    When Click on "מספר ח.פ." field
    And Clear "מספר ח.פ." field
    And Fill "מספר ח.פ." field with "<num>"
    Then Validate if "מספר ח.פ." field has invalid value
    And Validate if "מספר ח.פ." field has "מספר חברה לא תקין" alert
    Examples:
    |num|
    |12345678ש|
    |12345678901234567890|
    |1|
    |123|
    |1234|
    |12345|
    |123456|
    |1234567|
    |00000000     |
    |a            |
    |@12345       |
    |-1234567     |
    |12345678__   |
    |חפ1234567    |

 #pick ח.פ. של חברה from סוג זיהוי
  Scenario Outline: pick  ח.פ. של חברה from סוג זיהוי and fill ת.ז. with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זיהוי" field
    And choose " ח.פ. של חברה" field from "סוג זיהוי"
    And Click on "ח.פ. של חברה"
    When Click on "מספר ח.פ. של חברה" field
    And Clear "מספר ח.פ. של חברה" field
    And Fill "מספר ח.פ. של חברה" field with "<num>"
    Then Validate if "מספר ח.פ. של חברה" field has valid value
    Examples:
    |num|
    |12345678|

  Scenario Outline: pick ח.פ. של חברה from סוג זיהוי and fill ת.ז. with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זיהוי" field
    And choose "ח.פ. של חברה" field from "סוג זיהוי"
    And Click on "ח.פ. של חברה"
    When Click on "מספר ח.פ. של חברה" field
    And Clear "מספר ח.פ. של חברה" field
    And Fill "מספר ח.פ. של חברה" field with "<num>"
    Then Validate if "מספר ח.פ. של חברה" field has invalid value
    And Validate if "מספר ח.פ. של חברה" field has "מספר חברה לא תקין" alert
    Examples:
    |num|
    |12345678ש|
    |12345678901234567890|
    |1|
    |123|
    |1234|
    |12345|
    |123456|
    |1234567|
    |00000000     |
    |a            |
    |@12345       |
    |-1234567     |
    |12345678__   |
    |חפ1234567    |

 #pick אחר from סוג זיהוי
  Scenario Outline: pick  ח.פ. של חברה from סוג זיהוי and fill ת.ז. with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זיהוי" field
    And choose "אחר" field from "סוג זיהוי"
    And Click on "אחר"
    When Click on "מספר עמותה" field
    And Clear "מספר עמותה" field
    And Fill "מספר עמותה" field with "<num>"
    Then Validate if "מספר עמותה" field has valid value
    Examples:
    |num|
    |12345678|

  Scenario Outline: pick  ח.פ. של חברה from סוג זיהוי and fill ת.ז. with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זיהוי" field
    And choose "אחר" field from "סוג זיהוי"
    And Click on "אחר"
    When Click on "מספר עמותה" field
    And Clear "מספר עמותה" field
    And Fill "מספר עמותה" field with "<num>"
    Then Validate if "מספר עמותה" field has invalid value
    And Validate if "מספר ח.פ. של חברה" field has "שדה לא תקין" alert
    Examples:
    |num|
    |12345678ש|
    |12345678901234567890|
    |00000000     |
    |a            |
    |@12345       |
    |-1234567     |
    |12345678__   |
    |חפ    |


 # Test Cellphone field
  @Form
  Scenario: Cellphone suffix test with valid Value
    Given Navigate to "Parking" Page
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with "5768719"
    Then Validate if "טלפון נייד" field has valid value

  @Form
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

  @Critical
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

  @Critical
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
  @Critical
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

# Telephone field
  @Critical
  Scenario: Telephone suffix test with valid Value
    Given Navigate to "Parking" Page
    When Click on "טלפון קווי" field
    And Clear "טלפון קווי" field
    And Fill "טלפון קווי" field with "6287296"
    Then Validate if "טלפון קווי" field has valid value

  @Critical
  Scenario Outline: Telephone test with invalid Values (Only Numbers)
    Given Navigate to "Parking" Page
    When Click on "טלפון קווי" field
    And Clear "טלפון קווי" field
    And Fill "טלפון קווי" field with "<Text>"
    Then Validate if "טלפון קווי" field has invalid value
    And Validate if "טלפון קווי" field has "יש להשלים את הספרות החסרות" alert
    When Clear "טלפון קווי" field
    Examples:
      |Text|
      |0        |
      |01       |
      |012      |
      |0123     |
      |01234    |
      |012345   |

  @Critical
  Scenario Outline: Telephone test with invalid Values (Numbers and Symbols or letters)
    # In this scenario, two red label appears (complete the missing numbers, only numbers accepted)
    Given Navigate to "Parking" Page
    When Click on "טלפון קווי" field
    And Clear "טלפון קווי" field
    And Fill "טלפון קווי" field with "<Text>"
    Then Validate if "טלפון קווי" field has invalid value
    And Validate if "טלפון קווי" field has "יש להזין ספרות בלבד" alert
    And Validate if "טלפון קווי" field has "יש להשלים את הספרות החסרות" alert
    When Clear "טלפון קווי" field
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

  @Critical
  Scenario Outline: Telephone test with invalid Values (Numbers and Symbols or letters)
    Given Navigate to "Parking" Page
    When Click on "טלפון קווי" field
    And Clear "טלפון קווי" field
    And Fill "טלפון קווי" field with "<Text>"
    Then Validate if "טלפון קווי" field has invalid value
    And Validate if "טלפון קווי" field has "מספר לא תקין" alert
    When Clear "טלפון קווי" field
    Examples:
      |Text|
      |a123456|
      |ששששששש|
      |ششششششش|
      |aaaaaaa|
      |628729-|
      |-628729|

# Test Telephone prefix
  @Critical
  Scenario Outline: Telephone prefix test
    Given Navigate to "Parking" Page
    When Click on "pre_telephone" field
    And Fill "pre_telephone" field with "<num>"
    And Click on "<num>"
    Then Validate "pre_telephone"if correctly displayed
    Examples:
      |num|
      |02|
      |03|
      |04|
      |06|
      |08|
      |09|
      |072|
      |073|
      |077|

 # Email field test
  @Critical
  Scenario: Email test with valid Value
    Given Navigate to "Parking" Page
    When Click on "דוא"ל" field
    And Clear "דוא"ל" field
    And Fill "דוא"ל" field with "darweeshq@gmail.com"
    Then Validate if "דוא"ל" field has valid value

  @Critical
  Scenario: Email test with invalid Value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "דוא"ל" field
    And Clear "דוא"ל" field
    And Fill "דוא"ל" field with " "
    Then Validate if "דוא"ל" field has invalid value
    And Validate if "דוא"ל" field has "שדה חובה" alert

  @Critical
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

  # Cellphone Button test button
  @Critical
  Scenario: Pressing Cellphone Button
    Given Navigate to "Parking" Page
    When Press on "Cellphone" button
    Then Validate if color of "Cellphone" button is highlighted
    And Validate if "Cellphone" button is pressed
    And Validate if "Email" Button is NOT pressed
    And Validate if color of "Email" button is NOT highlighted

  # Email Button test button
 @Critical
 Scenario: Pressing Email Button
    Given Navigate to "Parking" Page
    When Press on "Email" button
    Then Validate if color of "Email" button is highlighted
    And Validate if "Email" button is pressed
    And Validate if "Cellphone" Button is NOT pressed
    And Validate if color of "Cellphone" button is NOT highlighted

 @Sanity
 @Critical
 Scenario: Press continue button with valid test (Fill all fields with correct values)
    Given Navigate to "Parking" Page
    When Click on "מס' רכב" field
    And Clear "מס' רכב" field
    And Fill "מס' רכב" field with "123456"
    When Click on "מס' דוח" field
    And Clear "מס' דוח" field
    And Fill "מס' דוח" field with "123456"
    When Click on "שם פרטי" field
    And Clear "שם פרטי" field
    And Fill "שם פרטי" field with "דרוויש"
    When Click on "שם משפחה" field
    And Clear "שם משפחה" field
    And Fill "שם משפחה" field with "קימרי"
    When Click on "סוג זיהוי" field
    And choose "ת.ז." field from "סוג זיהוי"
    And Click on "ת.ז."
    When Click on "מספר ת.ז." field
    And Clear "מספר ת.ז." field
    And Fill "מספר ת.ז." field with "039886544"
    When Click on "pre_cellphone" field
    And Fill "pre_cellphone" field with "052"
    And Click on "052"
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with "5768719"
    When Click on "pre_telephone" field
    And Fill "pre_telephone" field with "02"
    And Click on "02"
    When Click on "טלפון קווי" field
    And Clear "טלפון קווי" field
    And Fill "טלפון קווי" field with "6287296"
    When Click on "דוא"ל" field
    And Clear "דוא"ל" field
    And Fill "דוא"ל" field with "darweeshq@gmail.com"
    When Press on "Cellphone" button
    When Press on "המשך" button
    Then Validate if we are at page no. "2"
    #We can validate from page number

  Scenario: Press continue button with empty values
    Given Navigate to "Parking" Page
    When Press on "המשך" button
    Then Validate if "מס' רכב" field has invalid value
    Then Validate if "מס' דוח" field has invalid value
    Then Validate if "שם פרטי" field has invalid value
    Then Validate if "שם משפחה" field has invalid value
    Then Validate if "מספר ת.ז." field has invalid value
    Then Validate if "טלפון נייד" field has invalid value
    Then Validate if "דוא"ל" field has invalid value
    Then Validate if "מס' זיהוי" field has invalid value
    Then Validate if we are at page no. "2"
    #We can validate from page number