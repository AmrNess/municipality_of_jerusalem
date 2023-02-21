Feature: header, fields test of BusinessLicenseExists Form Page

  """
  - Feature file name: businessLicenseExists_page_6.feature
  - Form link: https://jeronlineforms.jerusalem.muni.il/BusinessLicenseExists
  - Number of Pages is : 11, We are at Page: 6
  - page name : בקשה להעתק רישיון
  - mandatory fields are: הצהרת כפל רישיון
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
    When Click On "הוספת קובץ" sign in "הצהרת כפל רישיון"
    Then Check if the "the_first_file" name is allowed
    And Check if the "the_first_file" type is allowed
    And Check if the "the_first_file" size is allowed
    And Pick the file
    And I click on "שמור" button
    And validate that field "הצהרת כפל רישיון" has "the_first_file"

  @form
  Scenario : download Request for a license copy
    Given I navigate to "BusinessLicenseExists" page
    When Click on "לחץ להורדת הטופס"
    Then validate that the file is clear

  @form
  Scenario : Check if the mandatory are invalid
    Given I navigate to "BusinessLicenseExists" page
    When I click on "המשך" button
    Then Validate that we are in step "בקשה להעתק רישיון" of the page
    Then Check if "הצהרת כפל רישיון" has "חובה לצרף קובץ" error message

  @form
  Scenario Outline: add file valid values test
    Given I navigate to "BusinessLicenseExists" page
    When Click On "הוספת קובץ" sign in "הצהרת כפל רישיון"
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
    When Click On "הוספת קובץ" sign in "הצהרת כפל רישיון"
    Then Check if the "<the_first_file>" name is allowed
    And Check if the "<the_first_file>" type is allowed
    And Check if the "<the_first_file>" size is allowed
    And Pick the file
    And Check if error message of "ת.ז. בעל העסק" is "סוג קובץ אינו חוקימותרים קבצים מסוג זה בלבד: .bmp, .gif, .png, .jpg, .jpeg, .doc, .docx, .pdf, .xlsx, .xls"
    Examples:
    | the_first_file                |
    | municipality_of_jerusalem.zip |












