Feature: header, fields test of BetterTaxPtor Form Page

  """
  - Feature file name: betterTaxPtor.feature
  - Form link: https://jeronlineforms.jerusalem.muni.il/BetterTaxPtor
  - Number of Pages is : 1, We are at Page: 1
  - mandatory fields are: מספר תיק בנין
  """
  @header
  Scenario: Check explanation of form
    Given I navigate to "BetterTaxPtor" page
    Then Is application information tittle is "הסבר למילוי הטופס:"
    And Check if application explanation have text

  @header
  Scenario: Check Print display
    Given I navigate to "BetterTaxPtor" page
    When I click on "הדפס" button
    Then Check if Print display is clear

  @form
  Scenario : full scenario for the page test (valid)
    Given I navigate to "BetterTaxPtor" page
    When I write "3327961844" in "מספר תיק בנין"
    And I click on "שמור" button
    Then validate that field "מספר תיק בנין" has "3327961844"

  @form
  Scenario : Check if the mandatory are invalid
    Given I navigate to "CollectiveLifeInsurance" page
    When I click on "המשך" button
    Then Validate that we are in step "פרטי הבקשה" of the page
    And Check if "מספר תיק בנין" has "חובה לבחור תיק קווי בנין" error message

  @form
  Scenario Outline: caseNumber valid value test
    Given I navigate to "BetterTaxPtor" page
    When I write "<case_number>" in "מספר תיק בנין"
    Then field "מספר תיק בנין" has valid value
    Examples:
    | case_number|
    | 3312123244 |
    | 2233445574 |
    | 1122334404 |
    | 2233114407 |
    | 1111111003 |
    | 2233445572 |
    | 2233422398 |
    | 5334567452 |
    | 1212121205 |
    | 0088008806 |
    | 4332434333 |
    | 7521231336 |
    | 1657865347 |

 @form
 Scenario Outline: caseNumber invalid value test
    Given I navigate to "BetterTaxPtor" page
    When I write "<case_number>" in "מספר תיק בנין"
    Then field "מספר תיק בנין" has valid value
    Examples:
    | case_number  |
    | @#$%^&*$FH   |
    | דגכעיחלטעכג   |
    | [لأأـ،لاتتتا]   |
    | لأأاتةلاتتتات   |
    | wqeewweeff   |
    | 2233422er8   |
    | weew567452   |
    | 121qwe1205   |
    | 0@#$$%%po6   |
    | 433$%&4333   |
    | 752123)(36   |
    | 16578%5347   |



