Feature: Testing and validation according to municipality requests list
  - Feature file name: EduInstituteRegistration_page1.feature
  - Form link: https://jeronlineforms-test.jerweb.jer/EduInstituteRegistration
  - Number of Pages is : 5, We are at Page: 1
  - All fields are mandatory.
  Notes:
  * In this form, all numeric fields accepts only numbers, and doesn't take letters or characters at all.

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
    Then Validate if we are at page number "1"

# פרטי תלמיד/ה
# form fields tests
 # סוג זהות dropdown menu
  Scenario Outline: pick option from סוג זהות
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "<option>" field with "סוג זהות"
    And Click on "<option>"
    Then Validate "<option>" if correctly displayed
    Examples:
    | option    |
    | זהות |
    | דרכון      |
    | אשרת שהייה |
    | זהות פקטיבית עירייה |
    | זהות פקטיבית עירייה|

  #pick תעודת זהות from סוג זהות
  Scenario: pick תעודת זהות from סוג זהות and fill תעודת זהות with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "תעודת זהות" field from "סוג זהות"
    And Click on "תעודת זהות"
    When Click on "זהות" field
    And Clear "זהות" field
    And Fill "זהות" field with "039886544"

   Scenario Outline: pick תעודת זהות from סוג זהות and fill תעודת זהות with invalid value (Only numbers)
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "תעודת זהות" field from "סוג זהות"
    And Click on "תעודת זהות"
    When Click on "תעודת זהות" field
    And Clear "זהות" field
    And Fill "זהות" field with "<num>"
    Then Validate if "זהות" field has invalid value
    And Validate if "זהות" field has "זהות לא תקין" alert
    And Clear "זהות" field
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

 Scenario Outline: pick תעודת זהות from סוג זהות and fill תעודת זהות with invalid value (Numbers and text)
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "תעודת זהות" field from "סוג זהות"
    And Click on "תעודת זהות"
    When Click on "תעודת זהות" field
    And Clear "זהות" field
    And Fill "זהות" field with "<text>"
    Then Validate if "זהות" field has invalid value
    And Validate if "זהות" field has "מספר זהות לא תקין" alert
    And Clear "זהות" field
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

 #pick דרכון from סוג זהות
  Scenario Outline: pick דרכון from סוג זהות and fill דרכון with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "דרכון" field from "סוג זהות"
    And Click on "דרכון"
    When Click on "דרכון" field
    And Clear "דרכון" field
    And Fill "דרכון" field with "<num>"
    Then Validate if "דרכון" field has valid value
    Examples:
    |num|
    |IS0123456|

  Scenario Outline: pick דרכון from סוג זהות and fill דרכון with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "דרכון" field from "סוג זהות"
    And Click on "דרכון"
    When Click on "דרכון" field
    And Clear "דרכון" field
    And Fill "דרכון" field with "<num>"
    Then Validate if "דרכון" field has invalid value
    And Validate if "דרכון" field has "דרכון לא תקין" alert
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

 #pick  אשרת שהייה from סוג זהות
  Scenario Outline: pick  אשרת שהייה   from סוג זהות and fill תעודת זהות with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "אשרת שהייה" field from "סוג זהות"
    And Click on "אשרת שהייה"
    When Click on "מספר אשרת שהייה" field
    And Clear "אשרת שהייה" field
    And Fill "אשרת שהייה" field with "<num>"
    Then Validate if "אשרת שהייה" field has valid value
    Examples:
    |num|
    |123456789|
    |AA1234567|

  Scenario Outline: pick  אשרת שהייה  from סוג זהות and fill אשרת שהייה with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "אשרת שהייה" field from "סוג זהות"
    And Click on "אשרת שהייה"
    When Click on "מספר אשרת שהייה" field
    And Clear "אשרת שהייה" field
    And Fill "אשרת שהייה" field with "<num>"
    Then Validate if "אשרת שהייה" field has invalid value
    And Validate if "אשרת שהייה" field has "יש להזין מספר באורך תקין" alert
    Examples:
    |num|
    |1|
    |123|
    |1234|
    |aaaa|
    |a123|

  Scenario Outline: pick  אשרת שהייה  from סוג זהות and fill אשרת שהייה with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "אשרת שהייה" field from "סוג זהות"
    And Click on "אשרת שהייה"
    When Click on "מספר אשרת שהייה" field
    And Clear "אשרת שהייה" field
    And Fill "אשרת שהייה" field with "<num>"
    Then Validate if "אשרת שהייה" field has invalid value
    And Validate if "אשרת שהייה" field has "יש להזין מספר באורך תקין" alert
    Examples:
    |num|
    |A123456789|
    |1234567890|

 #pick זהות פקטיבית עירייה from סוג זהות
  Scenario Outline: pick  זהות פקטיבית עירייה from סוג זהות and fill זהות פקטיבית עירייה with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose " זהות פקטיבית עירייה" field from "סוג זהות"
    And Click on "זהות פקטיבית עירייה"
    When Click on "מספר זהות פקטיבית עירייה" field
    And Clear "מספר זהות פקטיבית עירייה" field
    And Fill "מספר זהות פקטיבית עירייה" field with "<num>"
    Then Validate if "מספר זהות פקטיבית עירייה" field has valid value
    Examples:
    |num|
    |1234567890|

  Scenario Outline: pick זהות פקטיבית עירייה from סוג זהות and fill זהות פקטיבית עירייה with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "זהות פקטיבית עירייה" field from "סוג זהות"
    And Click on "זהות פקטיבית עירייה"
    When Click on "מספר זהות פקטיבית עירייה" field
    And Clear "מספר זהות פקטיבית עירייה" field
    And Fill "מספר זהות פקטיבית עירייה" field with "<num>"
    Then Validate if "מספר זהות פקטיבית עירייה" field has invalid value
    And Validate if "מספר זהות פקטיבית עירייה" field has "זהות לא תקין" alert
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

 #pick זהות פקטיבית עירייה from סוג זהות
  Scenario Outline: pick  זהות פקטיבית עירייה from סוג זהות and fill זהות פקטיבית עירייה with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "זהות פקטיבית עירייה" field from "סוג זהות"
    And Click on "זהות פקטיבית עירייה"
    When Click on "זהות פקטיבית עירייה" field
    And Clear "זהות פקטיבית עירייה" field
    And Fill "זהות פקטיבית עירייה" field with "<num>"
    Then Validate if "זהות פקטיבית עירייה" field has valid value
    Examples:
    |num|
    |123|
    |1234|
    |12345|
    |123456|
    |1234567|
    |12345678|
    |123456789|
    |1234567890|

  Scenario Outline: pick  זהות פקטיבית עירייה from סוג זהות and fill זהות פקטיבית עירייה with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "זהות פקטיבית עירייה" field from "סוג זהות"
    And Click on "זהות פקטיבית עירייה"
    When Click on "זהות פקטיבית עירייה" field
    And Clear "זהות פקטיבית עירייה" field
    And Fill "זהות פקטיבית עירייה" field with "<num>"
    Then Validate if "זהות פקטיבית עירייה" field has invalid value
    And Validate if "מספר זהות פקטיבית עירייה" field has "שדה לא תקין" alert
    Examples:
    |num|
    |1  |
    |12 |

# Checking the BirthDate field
  @Form
  @Critical
  Scenario Outline: Date test with valid values
    Given Navigate to "Parking" Page
    When Click on "תאריך לידה" field
    And Clear "תאריך לידה" field
    And Fill "תאריך לידה" field with "<Date>"
    Then Validate if "תאריך לידה" field has valid value
    Examples:
      | Date         |
      | 12/12/1988   |
      | 04/05/2000   |
      | 04042005     |
      | 04-04-2000   |
      | 04/04.2000   |
      | 24/12/2001   |
      | 3012/2000    |
      | a22/11/a2022 |

  @Form
  @Critical
  Scenario Outline: Date test with invalid values (Only Numbers)
    Given Navigate to "Parking" Page
    When Click on "תאריך לידה" field
    And Fill "תאריך לידה" field with "<Text>"
    Then Validate if "תאריך לידה" field has invalid value
    When Clear "תעודת זהות" field

    Examples:
      | Text     |
      | 1        |
      | 11       |
      | 111      |
      | 1111     |
      | 11111    |
      | 20201989 |
      | 40402000 |
      | 40101000 |
      | 0123456  |

  #פרטי הורה המגיש את הרישום
# סוג זהות dropdown menu
  Scenario Outline: pick option from סוג זהות
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "<option>" field with "סוג זהות"
    And Click on "<option>"
    Then Validate "<option>" if correctly displayed
    Examples:
    | option    |
    | זהות |
    | דרכון      |
    | אשרת שהייה |
    | זהות פקטיבית עירייה |
    | זהות פקטיבית עירייה|

  #pick תעודת זהות from סוג זהות
  Scenario: pick תעודת זהות from סוג זהות and fill תעודת זהות with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "תעודת זהות" field from "סוג זהות"
    And Click on "תעודת זהות"
    When Click on "זהות" field
    And Clear "זהות" field
    And Fill "זהות" field with "039886544"

   Scenario Outline: pick תעודת זהות from סוג זהות and fill תעודת זהות with invalid value (Only numbers)
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "תעודת זהות" field from "סוג זהות"
    And Click on "תעודת זהות"
    When Click on "תעודת זהות" field
    And Clear "זהות" field
    And Fill "זהות" field with "<num>"
    Then Validate if "זהות" field has invalid value
    And Validate if "זהות" field has "זהות לא תקין" alert
    And Clear "זהות" field
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

 Scenario Outline: pick תעודת זהות from סוג זהות and fill תעודת זהות with invalid value (Numbers and text)
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "תעודת זהות" field from "סוג זהות"
    And Click on "תעודת זהות"
    When Click on "תעודת זהות" field
    And Clear "זהות" field
    And Fill "זהות" field with "<text>"
    Then Validate if "זהות" field has invalid value
    And Validate if "זהות" field has "מספר זהות לא תקין" alert
    And Clear "זהות" field
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

 #pick דרכון from סוג זהות
  Scenario Outline: pick דרכון from סוג זהות and fill דרכון with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "דרכון" field from "סוג זהות"
    And Click on "דרכון"
    When Click on "דרכון" field
    And Clear "דרכון" field
    And Fill "דרכון" field with "<num>"
    Then Validate if "דרכון" field has valid value
    Examples:
    |num|
    |IS0123456|

  Scenario Outline: pick דרכון from סוג זהות and fill דרכון with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "דרכון" field from "סוג זהות"
    And Click on "דרכון"
    When Click on "דרכון" field
    And Clear "דרכון" field
    And Fill "דרכון" field with "<num>"
    Then Validate if "דרכון" field has invalid value
    And Validate if "דרכון" field has "דרכון לא תקין" alert
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

 #pick  אשרת שהייה from סוג זהות
 Scenario Outline: pick  אשרת שהייה   from סוג זהות and fill תעודת זהות with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "אשרת שהייה" field from "סוג זהות"
    And Click on "אשרת שהייה"
    When Click on "מספר אשרת שהייה" field
    And Clear "אשרת שהייה" field
    And Fill "אשרת שהייה" field with "<num>"
    Then Validate if "אשרת שהייה" field has valid value
    Examples:
    |num|
    |123456789|
    |AA1234567|

 Scenario Outline: pick  אשרת שהייה  from סוג זהות and fill אשרת שהייה with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "אשרת שהייה" field from "סוג זהות"
    And Click on "אשרת שהייה"
    When Click on "מספר אשרת שהייה" field
    And Clear "אשרת שהייה" field
    And Fill "אשרת שהייה" field with "<num>"
    Then Validate if "אשרת שהייה" field has invalid value
    And Validate if "אשרת שהייה" field has "יש להזין מספר באורך תקין" alert
    Examples:
    |num|
    |1|
    |123|
    |1234|
    |aaaa|
    |a123|

 Scenario Outline: pick  אשרת שהייה  from סוג זהות and fill אשרת שהייה with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "אשרת שהייה" field from "סוג זהות"
    And Click on "אשרת שהייה"
    When Click on "מספר אשרת שהייה" field
    And Clear "אשרת שהייה" field
    And Fill "אשרת שהייה" field with "<num>"
    Then Validate if "אשרת שהייה" field has invalid value
    And Validate if "אשרת שהייה" field has "יש להזין מספר באורך תקין" alert
    Examples:
    |num|
    |A123456789|
    |1234567890|

 #pick זהות פקטיבית עירייה from סוג זהות
 Scenario Outline: pick  זהות פקטיבית עירייה from סוג זהות and fill זהות פקטיבית עירייה with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose " זהות פקטיבית עירייה" field from "סוג זהות"
    And Click on "זהות פקטיבית עירייה"
    When Click on "מספר זהות פקטיבית עירייה" field
    And Clear "מספר זהות פקטיבית עירייה" field
    And Fill "מספר זהות פקטיבית עירייה" field with "<num>"
    Then Validate if "מספר זהות פקטיבית עירייה" field has valid value
    Examples:
    |num|
    |1234567890|

 Scenario Outline: pick זהות פקטיבית עירייה from סוג זהות and fill זהות פקטיבית עירייה with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "זהות פקטיבית עירייה" field from "סוג זהות"
    And Click on "זהות פקטיבית עירייה"
    When Click on "מספר זהות פקטיבית עירייה" field
    And Clear "מספר זהות פקטיבית עירייה" field
    And Fill "מספר זהות פקטיבית עירייה" field with "<num>"
    Then Validate if "מספר זהות פקטיבית עירייה" field has invalid value
    And Validate if "מספר זהות פקטיבית עירייה" field has "זהות לא תקין" alert
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

 #pick זהות פקטיבית עירייה from סוג זהות
 Scenario Outline: pick  זהות פקטיבית עירייה from סוג זהות and fill זהות פקטיבית עירייה with valid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "זהות פקטיבית עירייה" field from "סוג זהות"
    And Click on "זהות פקטיבית עירייה"
    When Click on "זהות פקטיבית עירייה" field
    And Clear "זהות פקטיבית עירייה" field
    And Fill "זהות פקטיבית עירייה" field with "<num>"
    Then Validate if "זהות פקטיבית עירייה" field has valid value
    Examples:
    |num|
    |123|
    |1234|
    |12345|
    |123456|
    |1234567|
    |12345678|
    |123456789|
    |1234567890|

 Scenario Outline: pick  זהות פקטיבית עירייה from סוג זהות and fill זהות פקטיבית עירייה with invalid value
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "זהות פקטיבית עירייה" field from "סוג זהות"
    And Click on "זהות פקטיבית עירייה"
    When Click on "זהות פקטיבית עירייה" field
    And Clear "זהות פקטיבית עירייה" field
    And Fill "זהות פקטיבית עירייה" field with "<num>"
    Then Validate if "זהות פקטיבית עירייה" field has invalid value
    And Validate if "מספר זהות פקטיבית עירייה" field has "שדה לא תקין" alert
    Examples:
    |num|
    |1  |
    |12 |

# Test Cellphone field
  @Form
  @Critical
  Scenario: Cellphone suffix test with valid Value
    Given Navigate to "Parking" Page
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with "5768719"
    Then Validate if "טלפון נייד" field has valid value

  @Form
  @Critical
  Scenario: Cellphone test with invalid Value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with " "
    Then Validate if "טלפון נייד" field has invalid value
    And Validate if "טלפון נייד" field has "שדה חובה" alert

  @Form
  @Critical
  Scenario Outline: Cellphone test with invalid Values (Only Numbers)
    Given Navigate to "Parking" Page
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with "<Text>"
    Then Validate if "טלפון נייד" field has invalid value
    And Validate if "טלפון נייד" field has "יש להשלים את הספרות החסרות" alert
    When Clear "טלפון נייד" field
    Examples:
      | Text    |
      | 0       |
      | 01      |
      | 012     |
      | 0123    |
      | 01234   |
      | 012345  |
      | 0123456 |

  @Form
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
      | Text   |
      | abcd   |
      | א      |
      | ا      |
      | -      |
      | .      |
      | ש12345 |
      | @12345 |
      | 333 33 |

  @Form
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
      | Text      |
      | a12345678 |
      | ששששששש   |
      | ششششششش   |
      | aaaaaaa   |
      | 03988654- |
      | -03988644 |

# Test Cellphone prefix
  @Form
  @Critical
  Scenario Outline: Cellphone prefix test
    Given Navigate to "Parking" Page
    When Click on "pre_cellphone" field
    And Fill "pre_cellphone" field with "<num>"
    And Click on "<num>"
    Then Validate "pre_cellphone"if correctly displayed
    Examples:
      | num |
      | 050 |
      | 051 |
      | 052 |
      | 053 |
      | 054 |
      | 055 |
      | 056 |
      | 057 |
      | 058 |
      | 059 |
      | 077 |

 # Email field test
  @Form
  @Critical
  Scenario: Email test with valid Value
    Given Navigate to "Parking" Page
    When Click on "דוא"ל" field
    And Clear "דוא"ל" field
    And Fill "דוא"ל" field with "darweeshq@gmail.com"
    Then Validate if "דוא"ל" field has valid value

  @Form
  @Critical
  Scenario: Email test with invalid Value (Empty space)
    Given Navigate to "Parking" Page
    When Click on "דוא"ל" field
    And Clear "דוא"ל" field
    And Fill "דוא"ל" field with " "
    Then Validate if "דוא"ל" field has invalid value
    And Validate if "דוא"ל" field has "שדה חובה" alert

  @Form
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
      | Text                      |
      | 0                         |
      | abc                       |
      | גגגג                      |
      | 01234567                  |
      | darweesh.                 |
      | .com                      |
      | @.com                     |
      | .@.com                    |
      | email#example.com         |
      | email address@example.com |
      | .email@example.com        |
      | e..mail@example.com       |
      | email@example             |

 # Click continue button without filling fields to check the mandatory fields
  #Todo: Check mandatory fields

 # Fill all fields with correct values
  Scenario: Fill all fields with correct values
    Given Navigate to "Parking" Page
    When Click on "סוג זהות" field
    And choose "תעודת זהות" field from "סוג זהות"
    And Click on "תעודת זהות"
    When Click on "זהות" field
    And Clear "זהות" field
    And Fill "זהות" field with "039886544"
    When Click on "תאריך לידה" field
    And Clear "תאריך לידה" field
    And Fill "תאריך לידה" field with "11111990"
    #TODO: Should find a way to distinguish between father and son data
     When Click on "סוג זהות" field
    And choose "תעודת זהות" field from "סוג זהות"
    And Click on "תעודת זהות"
    When Click on "זהות" field
    And Clear "זהות" field
    And Fill "זהות" field with "039886544"
    When Click on "pre_cellphone" field
    And Fill "pre_cellphone" field with "052"
    And Click on "052"
    When Click on "טלפון נייד" field
    And Clear "טלפון נייד" field
    And Fill "טלפון נייד" field with "5768719"
    When Click on "דוא"ל" field
    And Clear "דוא"ל" field
    And Fill "דוא"ל" field with "darweeshq@gmail.com"
    When Press on "המשך" button
    Then Validate if we are at page no. "2"