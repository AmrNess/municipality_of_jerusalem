Feature: Basic Test for FreedomInfo Form Page

  Scenario: check language page
    Given I navigate to "FreedomInfo" page
    Then I check the language is "עברית"
    When I switch the language to "Arabic"
    And I write "وسام" in "שם פרטי"

#  Scenario: check step number
#    Given I navigate to "FreedomInfo" page
#    When I write "وسام" in "שם פרטי"

#
#  Scenario: check alert label
#    Given I navigate to "FreedomInfo" page
#    When I write "ss" in "שם משפחה"
#    Then check if the "שם משפחה" error is "value not in hebrew"
#
#
#    Scenario: city name choised scroll
#      Given I navigate to "FreedomInfo" page
#      When I scroll to value "ירושלים" and "יישוב"
#      And I scroll to value "חרובה" and "רחוב:"

#

#
#
#  Scenario: check step number
#    Given I navigate to "FreedomInfo" page
#    When I check that the page number is  "3"
#    Then Am I in page "2"
#
#
#
#  Scenario: allert msg
#    Given I navigate to "FreedomInfo" page
#    When I write "ss" in "שם משפחה"
#    Then field "שם משפחה" has valid value
#    And check if the "שם משפחה" error is "אותיות בעברית"
#
#
#
#  Scenario: special needs
#    Given I navigate to "FreedomInfo" page
#    When I click on "SpecialNeeds" btn
#    Then close the menu
#
#
#  Scenario: check heder elements
#    Given I navigate to "FreedomInfo" page
#    When I check header
#    Then the head should be displayed
#
#    Scenario: check footer elements
#    Given I navigate to "FreedomInfo" page
#    When I check footer
#    Then the footer should be displayed
#
#
#  Scenario: check id type
#    Given I navigate to "FreedomInfo" page
#    When I choic id value "ת.ז." and "סוג זיהוי"
#
#  Scenario: city name choised
#    Given I navigate to "FreedomInfo" page
#    When I search value "ירושלים" and "יישוב"
#
#
#  Scenario: street name choised
#    Given I navigate to "FreedomInfo" page
#    When I search value "אל רשיד" and "רחוב:"
#
#
#  Scenario Outline: first name examples check
#    Given I navigate to "FreedomInfo" page
#    When I write "<text>" in "שם פרטי"
#    Examples:
#      | text   |
#      | ווסאם  |
#      | asdasd |
#      | ווסאם  |
#      | asdasd |
#      | אבגד/()'.,_-זחט12 |
#      | אבגד/()'.,_-זחט!  |
#      | אבגד/()'.,_-זחט@  |
#      | אבגד/()'.,_-זחט#  |
#      | אבגד/()'.,_-זחט$  |
#      | אבגד/()'.,_-זחט%  |
#      | אבגד/()'.,_-זחט^  |
#      | אבגד/()'.,_-זחט&  |
#      | אבגד/()'.,_-זחט*  |
#      | אבגד/()'.,_-זחט+  |
#      | אבג/12 |
#      | דהו!   |
#      | זחט@   |
#      | יכל#   |
#      | מנס$   |
#      | פצק%   |
#      | רשת^   |
#      | בגדי&   |
#      | הוזח*   |
#      | לכמנ+   |
#      | אבג/12 |
#      | דהו!   |
#      | זחט@   |
#      | יכל#   |
#      | מנס$   |
#      | פצק%   |
#      | רשת^   |
#      | בגדי&   |
#      | הוזח*   |
#      | לכמנ+   |
#      | אבג/() |
#      | רשת12  |
#      | בגדי!  |
#      | הוזח@  |
#      | לכמנ#  |
#
#
#
#  Scenario Outline: last name examples check
#    Given I navigate to "FreedomInfo" page
#    When I write "<text>" in "שם משפחה"
#    Examples:
#      | text   |
#      | ווסאם  |
#      | asdasd |
#      | ווסאם  |
#      | asdasd |
#      | 123    |
#
#  Scenario Outline: id examples check
#    Given I navigate to "FreedomInfo" page
#    When I write "<text>" in "מספר ת.ז."
#    Examples:
#      | text      |
#      | ווסאם     |
#      | 1212131   |
#      | ווס 22אם  |
#      | asdasd    |
#      | 315456737 |
#      | 123       |
#
#  Scenario Outline: phone three number examples check
#    Given I navigate to "FreedomInfo" page
#    When I picked value "<text>" and "dropDownPhone"
#    Examples:
#      | text |
#      | 059  |
#      | 050  |
#      | 052  |
#      | 053  |
#      | 054  |
#      | 077  |
#
#
#  Scenario Outline: phone examples check
#    Given I navigate to "FreedomInfo" page
#    When I write "<text>" in "טלפון נייד"
#    Examples:
#      | text      |
#      | text      |
#      | ווסאם     |
#      | 1212131   |
#      | ווס 22אם  |
#      | asdasd    |
#      | 315456737 |
#      | 4075877   |
#
#
#  Scenario Outline: tel three num examples check
#    Given I navigate to "FreedomInfo" page
#    When I picked value "<text>" and "dropDownTel"
#    Examples:
#      | text |
#      | 02   |
#      | 03   |
#      | 04   |
#      | 08   |
#      | 072  |
#      | 073  |
#
#
#  Scenario Outline: tel examples check
#    Given I navigate to "FreedomInfo" page
#    When I write "<text>" in "טלפון קווי"
#    Examples:
#      | text      |
#      | text      |
#      | ווסאם     |
#      | 1212131   |
#      | ווס 22אם  |
#      | asdasd    |
#      | 315456737 |
#      | 4075877   |
#
#
#  Scenario Outline: emails examples check
#    Given I navigate to "FreedomInfo" page
#    When I write "<text>" in "דוא"ל"
#    Examples:
#      | text     |
#      | w@w.com  |
#      | 1212131  |
#      | ווס 22אם |
#      | w@w      |
#      | dss      |
#
#  Scenario Outline: home number examples check
#    Given I navigate to "FreedomInfo" page
#    When I write "<text>" in "מספר בית"
#    Examples:
#      | text   |
#      | ווסאם  |
#      | asdasd |
#      | ווסאם  |
#      | asdasd |
#
#
#  Scenario Outline: mekod examples check
#    Given I navigate to "FreedomInfo" page
#    When I write "<text>" in "מיקוד"
#    Examples:
#      | text   |
#      | ווסאם  |
#      | asdasd |
#      | ווסאם  |
#      | asdasd |
#      | 123    |
#
#
#  @critical
#  Scenario: critical basic test
#    Given I navigate to "FreedomInfo" page
#    When I write "ווסאם" in "שם פרטי"
#    And I write "עוקה" in "שם משפחה"
#    And I write "1111111" in "מספר ת.ז."
#    And I picked value "052" and "טלפון נייד"
#    And I write "4075877" in "טלפון נייד"
#    And I picked value "072" and "טלפון קווי"
#    And I write "4075877" in "טלפון קווי"
#    And I write "w@w.com" in "דוא"ל"
#    Then field "שם פרטי" has valid value
#    Then I click on "המשך" button