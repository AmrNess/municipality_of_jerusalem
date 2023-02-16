Feature: Basic Test for BetterTaxPtor Form Page

  @header
  # excel sheet rule number 1
  Scenario: Check explanation of form
    Given I navigate to "BetterTaxPtor" page
    Then Is application information tittle is "הסבר למילוי הטופס:"
    And Check if application explanation have text

  @header
  # excel sheet rule number 21
  Scenario: Check Print display
    Given I navigate to "BetterTaxPtor" page
    When I click on "הדפס" button
    Then Check if Print display is clear

  @form
  # excel sheet rule number 11
  Scenario : full scenario for the page test (valid)
    Given I navigate to "BetterTaxPtor" page
    When I write "3327961844" in "מספר תיק בנין"
    And I click on "שמור" button
    Then validate that field "מספר תיק בנין" has "3327961844"

  @form
  # excel sheet rule number 18
  Scenario : Check if the mandatory are invalid
    Given I navigate to "CollectiveLifeInsurance" page
    When I click on "המשך" button
    Then Validate that we are in step "פרטי הבקשה" of the page
    And Check if "מספר תיק בנין" has "חובה לבחור תיק קווי בנין" error message

  @form
  # excel sheet rule number 5
  Scenario Outline: case number value test (valid)
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
 # excel sheet rule number 5
 Scenario Outline: case number value test (invalid)
    Given I navigate to "BetterTaxPtor" page
    When I write "<case_number>" in "מספר תיק בנין"
    Then field "מספר תיק בנין" has valid value
    Examples:
    | case_number|
    | 3312ed3244 |
    | 223weds574 |
    | wer2334404 |
    | 223311440w |
    | 111qw11003 |
    | wqeewweeff |
    | 2233422er8 |
    | weew567452 |
    | 121qwe1205 |
    | 0@#$$%%po6 |
    | 433$%&4333 |
    | 752123)(36 |
    | 16578%5347 |

  @form
  # excel sheet rule number 18
  Scenario Outline: case number error message test (invalid)
    Given I navigate to "CollectiveLifeInsurance" page
    When I write "<case_number>" in "מספר תיק בנין"
    Then Check field "מספר תיק בנין" has invalid value
    And Check if error message  of "מספר תיק בנין" is "חובה לבחור תיק קווי בנין"
    Examples:
    | case_number  |
    |              |
    | @#$%^&*$FH   |
    | דגכעיחלטעכג   |
    | [لأأـ،لاتتتا]   |
    | لأأاتةلاتتتات   |


