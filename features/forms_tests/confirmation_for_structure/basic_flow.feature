# Created by Amr.Shaloudi at 28/01/23
Feature: Basic Test for ConfirmationForStructure Form Page
  # Enter feature description here

#  @critical
#  Scenario: critical basic test
#    Given I navigate to "ConfirmationForStructure" page
#    When I write "ווסאם" in "שם פרטי"
#    And I write "עוקה" in "שם משפחה"
#    And I write "1111111" in "מספר ת.ז."
##    And I picked "052" in "טלפון נייד"
#    And I write "4075877" in "טלפון נייד"
##    And I picked "072" in "טלפון קווי"
#    And I write "4075877" in "טלפון קווי"
#    And I write "w@w.com" in "דוא"ל"
##    Then field "שם פרטי" has valid value
#    Then I click on "המשך" button



     Scenario Outline: basic test2 - just to check
       Given I navigate to "ConfirmationForStructure" page
       When I write "<text>" in "שם פרטי"
       When I write "<text>" in "שם משפחה"
       Examples:
        | text  |
        | ווסאם  |
        | asdasd|


      Scenario Outline: basic test2 - just to check
       Given I navigate to "ConfirmationForStructure" page
       When I write "<text>" in "שם פרטי"
       Then field "שם פרטי" has invalid value
       Examples:
        | text  |
        | עןקה  |
        | asdasd|



#  @blocker
#  Scenario: blocker basic test
#    Given I navigate to "ConfirmationForStructure" page
#    When I write "ווסאם" in "שם פרטי"
#    And I write "עוקה" in "שם משפחה"
#    And I write "1111111" in "מספר ת.ז."
##    And I picked "052" in "טלפון נייד"
#    And I write "4075877" in "cellphone"
##    And I picked "072" in "טלפון נייד"
#    And I write "4075877" in "phone"
#    And I write "w@w.com" in "דוא"ל"
#    Then field "שם פרטי" has valid value
#
#  @minor
#  Scenario: minor basic test
#    Given I navigate to "ConfirmationForStructure" page
#    When I write "ווסאם" in "שם פרטי"
#    And I write "עוקה" in "שם משפחה"
#    And I write "1111111" in "מספר ת.ז."
##    And I picked "052" in "טלפון נייד"
#    And I write "4075877" in "cellphone"
##    And I picked "072" in "טלפון נייד"
#    And I write "4075877" in "phone"
#    And I write "w@w.com" in "דוא"ל"
#    Then field "שם פרטי" has valid value

#  Scenario Outline: basic test2 - just to check
#    Given I navigate to "ConfirmationForStructure" page
#    When I write "<text>" in "שם פרטי"
#    Then field "שם פרטי" has invalid value
#    Examples:
#    | text  |
#    | יעחל  |
#    | asdasd|

