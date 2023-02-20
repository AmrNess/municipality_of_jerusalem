Feature: header, fields test of CollectiveLifeInsurance Form Page

  """
  - Feature file name: collectiveLifeInsurance.feature
  - Form link: https://jeronlineforms.jerusalem.muni.il/CollectiveLifeInsurance
  - Number of Pages is : 1, We are at Page: 1
  - mandatory fields are: מספר זהות
  """


  @Major
  @header
  Scenario: Check explanation of form
    Given I navigate to "CollectiveLifeInsurance" page
    Then Is application information tittle is "הסבר למילוי הטופס:"
    And Check if application explanation have text

  @Major
  @header
  Scenario: Check Print display
    Given I navigate to "CollectiveLifeInsurance" page
    When I click on "הדפס" button
    Then Check if Print display is clear

  @Critical
  @form
  Scenario : full scenario for the page with save click test (valid)
    Given I navigate to "CollectiveLifeInsurance" page
    When I write "332796184" in "מספר זהות"
    And I click on "שמור" button
    Then validate that field "מספר זהות" has "332796184"


  Scenario : save button  click test (BUG: the save button not working)
    Given I navigate to "CollectiveLifeInsurance" page
    And I click on "שמור" button
    Then Accept Alert message

  @Critical
  @form
  Scenario : Check if the mandatory are invalid
    Given I navigate to "CollectiveLifeInsurance" page
    When I click on "המשך" button
    Then Validate that we are in step "פרטי הצטרפות" of the page
    And Check if "מספר זהות" has "חובה למלא מספר זהות" error message

  @form
  Scenario Outline: id valid value test
    Given I navigate to "CollectiveLifeInsurance" page
    When I write "<id>" in "מספר זהות"
    Then Check field "מספר זהות" has valid value
    Examples:
    | id        |
    | 0         |
    | 331212324 |
    | 223344557 |
    | 112233440 |
    | 223311440 |
    | 111111100 |
    | 223344557 |
    | 223342239 |
    | 533456745 |
    | 121212120 |
    | 008800880 |
    | 433243433 |
    | 752123133 |
    | 165786534 |
    | 2345678234567823456782345678234567823456789345678 |

  @form
  Scenario Outline: id invalid value test (BUG)
    Given I navigate to "CollectiveLifeInsurance" page
    When I write "<id>" in "מספר זהות"
    Then Check field "מספר זהות" has invalid value
    Examples:
    | id                            |
    | 000000000                     |
    | 000000018                     |
    | 3327                          |
    | 3327981827336443728282        |
    | 12323432                      |
    | salem12321323142133           |
    | salem12345678934567467788998  |
    | 33279618433                   |
    | 3319                          |
    | 8888                          |
    | 0117                          |
    | 0190                          |
    | 22345567754                   |
    | 23e23443211343355             |
    | 33sham344557897               |
    | 33ק'/דגגבשד344557897          |
    | 33ק'سببسث344557897            |
    | 33ק'/דגגכבבשד344557897        |
    | 33!@#$%344557897             |
    | 33زسيhhjכעיח!@#$%344557897    |
    | 331133232ssd2321312233       |
    | 00                           |

  @form
  Scenario Outline: id wrong input error message test
    Given I navigate to "CollectiveLifeInsurance" page
    When I write "<id>" in "מספר זהות"
    Then Check field "מספר זהות" has invalid value
    And Check if error message of "מספר זהות" is "מספר זהות לא תקין"
    Examples:
    | id                            |
    | 000000001                     |
    | 000000118                     |
    | 000000009                     |
    | 3121                          |
    | 34379818234336234724282       |
    | 92443232                      |
    | salem12321342133              |
    | salem12343457893r44677458     |
    | 83427961833                   |
    | 3219                          |
    | 8883                          |
    | 0157                          |
    | 0180                          |
    | 22345556754                   |
    | 23e23444322343355             |
    | 33sham344557895               |
    | 33ק'/דגגבשד344554897          |
    | 33ק'سببسث344567897            |
    | 33ק'/דגגכבבשד34557897         |
    | 33!@#$%3445765897            |
    | 33زسيhhjכעיח!@#$%344557457    |
    | 331133232ssd24312233         |
    | 01                           |
    | 231312324                    |
    | 453344553                    |
    | 612235427                    |
    | 322314466                    |
    | 613167101                    |
    | 213141517                    |
    | 293942999                    |
    | 135416541                    |
    | 224222424                    |
    | 108102581                    |
    | 233243236                    |
    | 154528136                    |
    | 160786030                    |
    | 33ק'/דגגבשד34455789           |
    | 33ק'سببسث34455789             |
    | 33ק'/דגגכבבשד3445578          |
    | 33!@#$%34455789              |
    | 33زسيhhjכעיח!@#$%34455789     |
    | 233243423                    |
    | 223234545                    |
    | 344423542                    |
    | 679857840                    |
    | 887799887                    |

  @form
  Scenario: id empty error message test
    Given I navigate to "CollectiveLifeInsurance" page
    When I write " " in "מספר זהות"
    Then Check field "מספר זהות" has invalid value
    And Check if error message  of "מספר זהות" is "חובה למלא מספר זהות"

  @form
  Scenario Outline: id wrong input error message test (BUG)
    Given I navigate to "CollectiveLifeInsurance" page
    When I write "<id>" in "מספר זהות"
    Then Check field "מספר זהות" has invalid value
    And Check if error message  of "מספר זהות" is "מספר זהות לא תקין"
    Examples:
    | id                            |
    | 000000000                     |
    | 000000018                     |
    | 3327                          |
    | 3327981827336443728282        |
    | 12323432                      |
    | salem12321323142133           |
    | salem12345678934567467788998  |
    | 33279618433                   |
    | 3319                          |
    | 8888                          |
    | 0117                          |
    | 0190                          |
    | 22345567754                   |
    | 23e23443211343355             |
    | 33sham344557897               |
    | 33ק'/דגגבשד344557897          |
    | 33ק'سببسث344557897            |
    | 33ק'/דגגכבבשד344557897        |
    | 33!@#$%344557897             |
    | 33زسيhhjכעיח!@#$%344557897    |
    | 331133232ssd2321312233       |
    | 00                           |
    | 33ק'/דגגבשד344557897          |
    | 33ק'سببسث344557897            |
    | 33ק'/דגגכבבשד344557897        |
    | 33!@#$%344557897             |
    | 33زسيhhjכעיח!@#$%344557897    |



