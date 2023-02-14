Feature: Basic Test for Parking Form Page

Scenario: header footer test
    Given I navigate to "Parking" page
    When check if the application tittle is "שרותים דיגיטליים"
    And I choose "זהות" in search
    And I wait for "2" seconds
#    When I change page language to "العربية"
#    And check if  "العربية" language is in the application
#    And check if the application pic is available
#    And check if the application name is "חופש המידע"
#    And check if the application steps is available
#    And check if the application explanation is available
#    And check if the application rules are "שדות המסומנים ב-* (כוכבית) הם שדות חובה"
#    And check if the application call us is available
#    And check if the application privacy policy is available



