Feature: header, fields test of BusinessLicenseExists Form Page

  """
  - Feature file name: businessLicenseExists_page_6.feature
  - Form link: https://jeronlineforms.jerusalem.muni.il/BusinessLicenseExists
  - Number of Pages is : 11, We are at Page: 7
  - page name : הוספת / הסרת עיסוק
  - mandatory fields are: האם בוצע שינוי בעסק מהתכנית לפיה ניתן הרישיון
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
    # the + sign has no label
    When Click On "+" sign in " "
    And I pick "בריאות רוקחות וקוסמטיקה" in "קבוצת עיסוק"
    And I pick "1.2ב תמרוקים - אחסונם" in "פריט עיסוק"
    And I write "afdsd" in "תיאור עיסוק"
    And Choose "כן" in "האם בוצע שינוי בעסק מהתכנית לפיה ניתן הרישיון"
    And I click on "בבקשה לקבלת היתר מזורז א', היתר מזורז ב'" checkbox
    And I click on "בבקשה לרישיון שאינה במסלול מקוצר (למלא אם רלוונטי)'" checkbox
    And Click On "הוספת קובץ" sign in "תצהיר של המבקש היתר מזורז א'/היתר מזורז ב'/רישיון על יסוד תצהיר"
    Then Check if the "the_first_file" name is allowed
    And Check if the "the_first_file" type is allowed
    And Check if the "the_first_file" size is allowed
    And Pick the file
    And Click On "הוספת קובץ" sign in "קובץ תוכנית העסק"
    And Check if the "the_second_file" name is allowed
    And Check if the "the_second_file" type is allowed
    And Check if the "the_second_file" size is allowed
    And Pick the file
    And I click on "שמור" button
    And validate that field "קבוצת עיסוק" has "בריאות רוקחות וקוסמטיקה"
    And validate that field "פריט עיסוק" has "1.2ב תמרוקים - אחסונם"
    And validate that field "תיאור עיסוק" has "afdsd"
    And validate that field "האם בוצע שינוי בעסק מהתכנית לפיה ניתן הרישיון" has "כן"
    And validate that field "בבקשה לקבלת היתר מזורז א', היתר מזורז ב'" is clicked
    And validate that field "בבקשה לרישיון שאינה במסלול מקוצר (למלא אם רלוונטי)'" is clicked
    And validate that field "תצהיר של המבקש היתר מזורז א'/היתר מזורז ב'/רישיון על יסוד תצהיר" has "the_first_file"
    And validate that field "קובץ תוכנית העסק" has "the_second_file"

  @form
  Scenario : download Affidavit of the permit applicant copy
    Given I navigate to "BusinessLicenseExists" page
    When Click on "לחץ להורדת הטופס"
    Then validate that the file is clear

  @form
  Scenario : Check if the mandatory are invalid
    Given I navigate to "BusinessLicenseExists" page
    When I click on "המשך" button
    Then Validate that we are in step "הוספת / הסרת עיסוק" of the page
    Then Check if "קבוצת עיסוק" has "יש למלא קבוצת עיסוק" error message
    And Check if "פריט עיסוק" has "יש למלא פריט עיסוק" error message
    And Check if "האם בוצע שינוי בעסק מהתכנית לפיה ניתן הרישיון" has "נא לסמן האם בוצע שינוי בעסק מהתכנית לפיה ניתן הרישיון" error message


  @form
  Scenario Outline: job group valid value test
    Given I navigate to "BusinessLicenseExists" page
    When I pick "<job_group>" in "קבוצת עיסוק"
    Examples:
    | job_group             |
    | בריאות רוקחות וקוסמטיקה |
    | דלק ואנרגיה            |
    | מסחר ושונות            |
    | שילוט                  |


  @form
  Scenario Outline: job item valid value test
    Given I navigate to "BusinessLicenseExists" page
    When I pick "<job_item>" in "פריט עיסוק"
    Examples:
    | job_item                        |
    | 2.1ב     גז - אחסונו            |
    | 2.2ה     דלק לסוגיו - מסופי דלק  |
    | 2.4      תחנת כח                |




  @form
  Scenario Outline: Job Description valid values test
    Given I navigate to "BusinessLicenseExists" page
    When I write "<job_description>" in "תיאור עיסוק"
    Then Check field "תיאור עיסוק" has valid valid
    And Validate that "תיאור עיסוק" have the input only Hebrew with the allowed signs
    Examples:
    | job_description   |
    | פראס              |
    | שדכשד__שדג        |
    | שדג_שגדג          |
    | דכ.כשכד           |
    | דש)כדשכדכ         |

  @form
  Scenario Outline: Job Description invalid values test (BUG)
    Given I navigate to "BusinessLicenseExists" page
    When I write "<job_description>" in "תיאור עיסוק"
    Then Check field "תיאור עיסוק" has valid valid
    And Validate that "תיאור עיסוק" have the input only Hebrew with the allowed signs
    Examples:
    | job_description      |
    | سفغعه           |
    | 345يبلات#$%      |
    | ؤرلاع%^&dfghj    |
    | dfghj$%^&*      |
    | ertyuh$%^       |
    | כעיחRTYU4%^&%^  |


  @form
  Scenario Outline: Job Description wrong input error message (BUG)
    Given I navigate to "BusinessLicenseExists" page
    When I write "<job_description>" in "שם פרטי"
    Then Check field "שם פרטי" has invalid value
    And Check if error message of "שם פרטי" is "יש להזין אותיות בעברית בלבד ותווים מיוחדים " / () ' . , _ -"
    Examples:
    | job_description       |
    |   fira$%^&*s          |
    |   asdassdכעיيبلاتas     |
    |   fiwrqrwwras         |
    |   firdasd3r3ras       |


  @form
  Scenario Outline: add file valid values test
    Given I navigate to "BusinessLicenseExists" page
    When Click On "הוספת קובץ" sign in "תצהיר של המבקש היתר מזורז א'/היתר מזורז ב'/רישיון על יסוד תצהיר"
    Then Check if the "<the_first_file>" name is allowed
    And Check if the "<the_first_file>" type is allowed
    And Check if the "<the_first_file>" size is allowed
    And Pick the file
    When Click On "הוספת קובץ" sign in "קובץ תוכנית העסק"
    Then Check if the "<the_second_file>" name is allowed
    And Check if the "<the_second_file>" type is allowed
    And Check if the "<the_second_file>" size is allowed
    And Pick the file
    Examples:
    | the_first_file     |the_second_file    |
    | website.docx       |website.docx       |
    | טפסים לאוטומציה.xlsx|טפסים לאוטומציה.xlsx|
    | Form.PDF           |Form.PDF           |


  @form
  Scenario Outline: add file invalid values error message test
    Given I navigate to "BusinessLicenseExists" page
    When Click On "הוספת קובץ" sign in "תצהיר של המבקש היתר מזורז א'/היתר מזורז ב'/רישיון על יסוד תצהיר"
    Then Check if the "<the_first_file>" name is allowed
    And Check if the "<the_first_file>" type is allowed
    And Check if the "<the_first_file>" size is allowed
    And Pick the file
    And Check if error message of "תצהיר של המבקש היתר מזורז א'/היתר מזורז ב'/רישיון על יסוד תצהיר" is "סוג קובץ אינו חוקימותרים קבצים מסוג זה בלבד: .bmp, .gif, .png, .jpg, .jpeg, .doc, .docx, .pdf, .xlsx, .xls"
    When Click On "הוספת קובץ" sign in "קובץ תוכנית העסק"
    Then Check if the "<the_second_file>" name is allowed
    And Check if the "<the_second_file>" type is allowed
    And Check if the "<the_second_file>" size is allowed
    And Pick the file
    And Check if error message of "קובץ תוכנית העסק" is "סוג קובץ אינו חוקימותרים קבצים מסוג זה בלבד: .bmp, .gif, .png, .jpg, .jpeg, .doc, .docx, .pdf, .xlsx, .xls"
    Examples:
    | the_first_file                |the_second_file                |
    | municipality_of_jerusalem.zip |municipality_of_jerusalem.zip |








