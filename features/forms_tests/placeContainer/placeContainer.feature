Feature: Basic Test for PlaceContainer Form Page

#  Scenario: radio button Test
#    Given I navigate to "PlaceContainer" page
#    When I pick "ח.פ." in "סוג זהות"
#    And I wait for "3" seconds
#    And Is "ת.ז." selected in "סוג זהות"
#    Then field "סוג זהות" has valid value

#    Scenario: page steps test
#    Given I navigate to "PlaceContainer" page
#    When we have "2" steps in this page
#    When steps tittle is "שלבי הבקשה"
#    When Are we in the "פרטי הבקשה" step


  Scenario: page header test
    Given I navigate to "PlaceContainer" page
#    When Is header tittle is "שרותים דיגיטליים"
#    And Is header Logo is displayed
#    And Is application name is "בקשה להנחת מכולה אגף אכיפה ושיטור"
#    And Is application status is "סטטוס: חדש"
#    And Did application filled in "תאריך מילוי הטופס: 13/02/2023"
    When Click on "מידע" button
    And I wait for "2" seconds
    And Close the information tab
#    And Is application information tittle is "הסבר למילוי הטופס:"
#    When Click on "שמור" button
#    And Accept the alert
#    And I wait for "3" seconds
#    When Click on "הדפס" button
#    And Cancel the print option
#    And Does information have text
#    When Does application explanation have text
#     When Click on "המשך" button
#     When Click on "חזור" button







