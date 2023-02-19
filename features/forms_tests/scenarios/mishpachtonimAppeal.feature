Feature: header, fields test of MishpachtonimAppeal Form Page

  """
  - Feature file name: mishpachtonimAppeal.feature
  - Form link: https://jeronlineforms.jerusalem.muni.il/MishpachtonimAppeal
  - Number of Pages is : 2, We are at Page: 1
  - mandatory fields are: מספר זהות תלמיד, מספר זהות הורה
  """

  @header
  # excel sheet rule number 1
  Scenario: Check explanation of form
    Given I navigate to "MishpachtonimAppeal" page
    Then Is application information tittle is "הסבר למילוי הטופס:"
    And Check if application explanation have text

  @header
  # excel sheet rule number 21
  Scenario: Check Print display
    Given I navigate to "MishpachtonimAppeal" page
    When I click on "הדפס" button
    And Check if Print display is clear

  @form
  # excel sheet rule number 11
  Scenario : full scenario for the page test (valid)
    Given I navigate to "PlaceContainer" page
    When Choose "ת.ז." in "סוג זהות תלמיד"
    And I write "332796184" in "מספר זהות תלמיד"
    And Choose "ת.ז." in "סוג זהות הורה"
    And I write "334496184" in "מספר זהות הורה"
    And I pick "תשפ"ד - 2024" in "שנת רישום"
    And I pick "ערעור על החלטת הוועדה" in "סוג הפניה"
    And I click on "שמור" button
    Then validate that field "סוג זהות תלמיד" has "ת.ז."
    And validate that field "מספר זהות תלמיד" has "332796184"
    And validate that field "סוג זהות הורה" has "ת.ז."
    And validate that field "מספר זהות הורה" has "334496184"
    And validate that field "שנת רישום" has "תשפ"ד - 2024"
    And validate that field "סוג הפניה" has "ערעור על החלטת הוועדה"

  @form
  # excel sheet rule number 18
  Scenario : Check if the mandatory are invalid
    Given I navigate to "CollectiveLifeInsurance" page
    When I click on "שמור" button
    Then Validate that we are in step "פרטי ילד ומגיש הבקשה" of the page
    And Check if "מספר זהות תלמיד" has "יש להזין מספר זהות" error message
    And Check if "מספר זהות הורה" has "יש להזין מספר זהות" error message

    @form
   # excel sheet rule number 3
  Scenario Outline: student, parent id value test (valid)
    Given I navigate to "ContractorEmpRights" page
    When Choose "ת.ז." in "סוג זהות תלמיד"
    And I write "<student_id>" in "מספר זהות תלמיד"
    And Choose "ת.ז." in "סוג זהות הורה"
    And I write "<parent_id>" in "מספר זהות הורה"
    Then Check field "מספר זהות תלמיד" has valid value
    And Check field "מספר זהות הורה" has valid value
    Examples:
    | student_id| parent_id |
    | 331212324 | 165786534 |
    | 223344557 | 752123133 |
    | 112233440 | 433243433 |
    | 223311440 | 008800880 |
    | 111111100 | 121212120 |
    | 223344557 | 121212120 |
    | 223342239 | 533456745 |
    | 533456745 | 223342239 |
    | 121212120 | 223344557 |
    | 008800880 | 111111100 |
    | 433243433 | 223311440 |
    | 752123133 | 112233440 |
    | 165786534 | 223344557 |



  @form
  # excel sheet rule number 3
  # BUG:
  # Another BUG : the student, parent id that contains one letter until 16 number
  Scenario Outline: id value test (invalid)
    Given I navigate to "MishpachtonimAppeal" page
    When Choose "ת.ז." in "סוג זהות תלמיד"
    And I write "<student_id>" in "מספר זהות תלמיד"
    And Choose "ת.ז." in "סוג זהות הורה"
    And I write "<parent_id>" in "מספר זהות הורה"
    Then Check field "מספר זהות תלמיד" has valid value
    And Check field "מספר זהות הורה" has valid value
    Examples:
    | student_id                    | parent_id                     |
    | 000000000                     |000000000                      |
    | 000000018                     |000000018                      |
    | 3327981827336443728282        |3327981827336443728282         |
    | 12321323142133                |12321323142133                 |
    | 12345678934567467788998       |12345678934567467788998        |
    | 33279618433                   |33279618433                    |
    | 22345567754                   |22345567754                    |
    | 2323443211343355              |2323443211343355               |
    | 33344557897                   |33344557897                    |
    | 00                            |00                             |

  @form
  # excel sheet rule number 18
  # BUG:
  Scenario Outline: student, parent id error message test (invalid) and student, parent id value test (invalid)
    Given I navigate to "MishpachtonimAppeal" page
    When Choose "ת.ז." in "סוג זהות תלמיד"
    And I write "<student_id>" in "מספר זהות תלמיד"
    And Choose "ת.ז." in "מספר זהות הורה"
    And I write "<parent_id>" in "מספר זהות הורה"
    Then Check field "מספר זהות תלמיד" has invalid value
    And Check field "מספר זהות הורה" has invalid value
    And Check if error message of "מספר זהות תלמיד" is "מספר זהות לא תקין"
    And Check if error message of "מספר זהות הורה" is "מספר זהות לא תקין"
    Examples:
        |student_id                     |parent_id                    |
    | 000000001                     |000000001                    |
    | 000000118                     |000000118                    |
    | 000000009                     |000000009                    |
    | 3121                          |3121                         |
    | 34379818234336234724282       |34379818234336234724282      |
    | 92443232                      |92443232                     |
    | salem12321342133              |salem12321342133             |
    | salem12343457893r44677458     |salem12343457893r44677458    |
    | 83427961833                   |83427961833                  |
    | 3219                          |3219                         |
    | 8883                          |8883                         |
    | 0157                          |0157                         |
    | 0180                          |0180                         |
    | 22345556754                   |22345556754                  |
    | 23e23444322343355             |23e23444322343355            |
    | 33sham344557895               |33sham344557895              |
    | 33ק'/דגגבשד344554897          |33ק'/דגגבשד344554897          |
    | 33ק'سببسث344567897            |33ק'سببسث344567897            |
    | 33ק'/דגגכבבשד34557897         |33ק'/דגגכבבשד34557897          |
    | 33!@#$%3445765897            |33!@#$%3445765897             |
    | 33زسيhhjכעיח!@#$%344557457    |33زسيhhjכעיח!@#$%344557457    |
    | 331133232ssd24312233         |331133232ssd24312233          |
    | 01                           |01                            |
    | 231312324                    |231312324                     |
    | 453344553                    |453344553                     |
    | 612235427                    |612235427                     |
    | 322314466                    |322314466                     |
    | 613167101                    |613167101                     |
    | 213141517                    |213141517                     |
    | 293942999                    |293942999                     |
    | 135416541                    |135416541                     |
    | 224222424                    |224222424                     |
    | 108102581                    |108102581                     |
    | 233243236                    |233243236                     |
    | 154528136                    |154528136                     |
    | 160786030                    |160786030                     |


  @form
  # excel sheet rule number 5
  # BUG:
  Scenario Outline: student, parent id value allow to write just numbers test (invalid)
    Given I navigate to "MishpachtonimAppeal" page
    When Choose "ת.ז." in "סוג זהות תלמיד"
    And I write "<student_id>" in "מספר זהות תלמיד"
    Then Check field "מספר זהות תלמיד" has invalid value
    When Choose "ת.ז." in "מספר זהות הורה"
    And I write "<parent_id>" in "מספר זהות הורה"
    Then Check field "מספר זהות הורה" has invalid value
    And Validate that "מספר זהות תלמיד" have the input with only numbers
    And Validate that "מספר זהות הורה" have the input with only numbers
    Examples:
    | student_id  |parent_id      |
    | 3456789فغع  | فب7ل8هةخسخ     |
    | صثقفغعهنن    | 5d5f6g8i9k    |
    | wadwdwwdd   | erty#$%^      |
    | 45658987e   | ר6ע789חח0      |
    | awdawdadd   | ג56כעי**       |
    | 356534567   | rtnml,.g@#     |
    | 22334ttfd   | $%^&*بلات7هi     |
    | esfsefsff   | דגכעיחחלךן      |
    | 22sdfs440   | r6tu6t8iii     |
    | 111#$%&00   | e456rtyui       |
    | 223עיחל57   | rtyuighj        |
    | 223بتتن39   | 567g09ujko      |
    | 5$^%rtyh    | 456fg7hjkcf6g7u |
    | 1212@@$20   | s45fygu$%^      |
    | 0088OIk80   | ertyuifgh       |
    | 433opl433   | ft6ty7huj9iko   |
    | 75כע23133   | يبلاتنيبلاتن       |
    | ראטוןןלםם    | !@#$%^&*        |
    | المينسةؤن    | ][لأأٌلأاـ،/        |
    | dlkjhokjl   | !َ@#$%^ٌغهع        |

  @form
  Scenario: year and reason check value test (valid)
    Given I navigate to "MishpachtonimAppeal" page
    When I pick "תשפ"ד - 2024" in "שנת רישום"
    And I pick "ערעור על החלטת הוועדה" in "סוג הפניה"
