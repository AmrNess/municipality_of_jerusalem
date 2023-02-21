Feature: header, fields test of BusinessLicenseExists Form Page


  """
  - Feature file name: businessLicenseExists_page_5.feature
  - Form link: https://jeronlineforms.jerusalem.muni.il/BusinessLicenseExists
  - Number of Pages is : 11, We are at Page: 8
  - page name : הוספת שילוט
  - mandatory fields are: האם השלט מוצב, סוג השלט, תאריך הצבת השלט, תיאור המקום בו יוצב השלט, תוכן השלט
  """

  @header
  Scenario: Check explanation of form
    Given I navigate to "BusinessLicenseExists" page
    Then Is application information tittle is "הסבר למילוי הטופס:"
    And Check if application explanation have text

  @header
  Scenario: Check Print display
    Given I navigate to "BusinessLicenseExists" page
    When I click on "הדפס" button
    And Check if Print display is clear

  @form
  Scenario : full scenario for the page test (valid)
    Given I navigate to "BusinessLicenseExists" page
    When Choose "כן" in "האם השלט מוצב?"
    And I pick "שלט" in "סוג השלט"
    And I write "34" in "אורך במ"ר"
    And I write "34" in "רוחב במ"ר"
    And I pick date of "12/4/2023" in "תאריך הצבת השלט"
    And I write "לגדיגיג" in "תיאור המקום בו יוצב השלט"
    And I write "לגדיגיג" in "תוכן השלט"
    And Click On "הוספת קובץ" sign in "תמונה ברורה של השלט"
    Then Check if the "the_first_file" name is allowed
    And Check if the "the_first_file" type is allowed
    And Check if the "the_first_file" size is allowed
    And Pick the file
    And I click on "שמור" button
    And validate that field "האם השלט מוצב?" has "כן"
    And validate that field "סוג השלט" has "שלט"
    And validate that field "אורך במ"ר" has "34"
    And validate that field "רוחב במ"ר" has "34"
    And validate that field "תאריך הצבת השלט" has "12/4/2023"
    And validate that field "תיאור המקום בו יוצב השלט" has "לגדיגיג"
    And validate that field "תוכן השלט" has "לגדיגיג"
    And validate that field "תמונה ברורה של השלט" has "the_first_file"

  @form
  Scenario : Check if the mandatory are invalid
    Given I navigate to "BusinessLicenseExists" page
    When I click on "המשך" button
    Then Validate that we are in step "הוספת שילוט" of the page
    And Check if "האם השלט מוצב?" has "חובה לסמן כן / לא" error message
    And Check if "סוג השלט" has "חובה לבחור את סוג השלט" error message
    And Check if "תאריך הצבת השלט" has "חובה לבחור את תאריך הצבת השלט" error message
    And Check if "תיאור המקום בו יוצב השלט" has "חובה להזין את תיאור המקום בו יוצב השלט" error message
    And Check if "תוכן השלט" has "חובה להזין את תוכן השלט" error message



  @form
  Scenario Outline: The type of remote valid value test
    Given I navigate to "BusinessLicenseExists" page
    When I pick "<type_of_remote>" in "סוג השלט"
    Examples:
    | type_of_remote|
    | שלט זיהוי      |
    | חלון ראוה      |
    | אלקטרוני פרטי  |
    | מוסד אלקטרוני  |

  @form
  Scenario Outline: Length, Width in square meters valid value test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<Length>" in "אורך במ"ר"
    When I write "<Width>" in "רוחב במ"ר"
    Then Check field "אורך במ"ר" has valid value
    Then Check field "רוחב במ"ר" has valid value
    Examples:
    | Length    |Width     |
    | 331212324 |331212324 |
    | 223344557 |223344557 |
    | 112233440 |112233440 |
    | 223311440 |223311440 |
    | 111111100 |111111100 |
    | 223344557 |223344557 |
    | 223342239 |223342239 |
    | 533456745 |533456745 |
    | 121212120 |121212120 |
    | 008800880 |008800880 |
    | 433243433 |433243433 |
    | 752123133 |752123133 |
    | 165786534 |165786534 |


  @form
  Scenario Outline: Length, Width in square meters invalid value test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<Length>" in "אורך במ"ר"
    When I write "<Width>" in "רוחב במ"ר"
    Then Check field "אורך במ"ר" has valid value
    Then Check field "רוחב במ"ר"" has valid value
    And validate that field "אורך במ"ר" has empty field
    And validate that field "אורך במ"ר" has empty field
    Examples:
    | Length                    |Width                       |
    | salem12321342133          |salem12321342133            |
    | salem12343457893r44677458 |salem12343457893r44677458   |
    | $%33sham344557895         |$%33sham344557895           |
    | d33ק'/דגגבשד344554897      |d33ק'/דגגבשד344554897       |
    | 33ק'سببسثsd344567897       |33ק'سببسثsd344567897        |
    | %^&33!@#$%3445765897      |%^&33!@#$%3445765897        |
    | 33زسيhhjכעיח!@#$%344557457 | 33زسيhhjכעיח!@#$%344557457 |
    | a331133232ssd24312233     |a331133232ssd24312233       |
    | 000000018                 |000000018                   |


  @form
  Scenario Outline: Description of the place, contents of the sign valid values test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<description>" in "תיאור המקום בו יוצב השלט"
    And I write "<contents>" in "תוכן השלט"
    Then Check field "תיאור המקום בו יוצב השלט" has valid valid
    And Check field "תוכן השלט" has valid valid
    And Validate that "תיאור המקום בו יוצב השלט" have the input only Hebrew with the allowed signs
    And Validate that "תוכן השלט" have the input only Hebrew with the allowed signs
    Examples:
    | description  | contents    |
    | פראס         | א-בו דגככ    |
    | שדכשד__שדג   | שדגשד)(גשדג   |
    | שדג_שגדג     | שדגשדג       |
    | דכ.כשכד      | דשכשד)כדכ    |
    | דש)כדשכדכ    | דכדש-דככד    |

  @form
  Scenario Outline: Description of the place, contents of the sign invalid values test (BUG)
    Given I navigate to "BusinessLicenseExists" page
    When I write "<description>" in "תיאור המקום בו יוצב השלט"
    And I write "<contents>" in "תוכן השלט"
    Then Check field "תיאור המקום בו יוצב השלט" has valid valid
    And Check field "תוכן השלט" has valid valid
    And Validate that "תיאור המקום בו יוצב השלט" have the input only Hebrew with the allowed signs
    And Validate that "תוכן השלט" have the input only Hebrew with the allowed signs
    Examples:
    | description     | contents        |
    | سفغعه           | يبلاتنم            |
    | 345يبلات#$%      | يبلات567$%^        |
    | ؤرلاع%^&dfghj    | fghj567          |
    | dfghj$%^&*      | DFGHJrtyj$%^6    |
    | ertyuh$%^       | $%^&FGHcvbn      |
    | כעיחRTYU4%^&%^  | $%^&RTYقفغfghعه   |

  @form
  Scenario: Description of the place, contents of the sign empty field error message (valid)
    Given I navigate to "BusinessLicenseExists" page
    When I write " " in "תיאור המקום בו יוצב השלט"
    When I write " " in "תוכן השלט"
    Then Check field "תיאור המקום בו יוצב השלט" has invalid value
    Then Check field "תוכן השלט" has invalid value
    And Check if error message of "תיאור המקום בו יוצב השלט" is "חובה להזין את תיאור המקום בו יוצב השלט"
    And Check if error message of "תוכן השלט" is "חובה להזין את תוכן השלט"

  @form
  Scenario Outline: Description of the place, contents of the sign wrong input error message (BUG)
    Given I navigate to "BusinessLicenseExists" page
    When I write "<description>" in "תיאור המקום בו יוצב השלט"
    And I write "<contents>" in "תוכן השלט"
    Then Check field "תיאור המקום בו יוצב השלט" has valid valid
    And Check field "תוכן השלט" has valid valid
    And Check if error message of "תיאור המקום בו יוצב השלט" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    And Check if error message of "תוכן השלט" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | description            | contents            |
    |   firas               |  firas               |
    |   asdas               |   asdas              |
    |   fiwrqrwwras         |  fiwrqrwwras         |
    |   firdasd3r3ras       |  firdasd3r3ras       |

  @form
  Scenario Outline: add file valid values test
    Given I navigate to "BusinessLicenseExists" page
    When Click On "הוספת קובץ" sign in "תמונה ברורה של השלט"
    Then Check if the "<the_first_file>" name is allowed
    And Check if the "<the_first_file>" type is allowed
    And Check if the "<the_first_file>" size is allowed
    And Pick the file
    Examples:
    | the_first_file     |
    | website.docx       |
    | טפסים לאוטומציה.xlsx|
    | Form.PDF           |


  @form
  Scenario Outline: add file invalid values error message test
    Given I navigate to "BusinessLicenseExists" page
    When Click On "הוספת קובץ" sign in "תמונה ברורה של השלט"
    Then Check if the "<the_first_file>" name is allowed
    And Check if the "<the_first_file>" type is allowed
    And Check if the "<the_first_file>" size is allowed
    And Pick the file
    And Check if error message of "תמונה ברורה של השלט" is "סוג קובץ אינו חוקימותרים קבצים מסוג זה בלבד: .bmp, .gif, .png, .jpg, .jpeg, .doc, .docx, .pdf, .xlsx, .xls"
    Examples:
    | the_first_file                |
    | municipality_of_jerusalem.zip |












