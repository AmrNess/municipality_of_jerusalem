Feature: Test for DogHoldingLic Form Page

  Scenario: check form explanation
    Given I navigate to "DogHoldingLic" page
    Then check the explanation tittle
    And check the explanation body


#  Scenario:DogHoldingLic step 1
#    #fill first step to go to the next step
#    Given I navigate to "DogHoldingLic" page
#    When I write "1111111" in "מספר ת.ז."
#    And I write "ווסאם" in "שם פרטי"
#    And I write "עוקה" in "שם משפחה"
#    And I write "w@w.com" in "דוא"ל"
#    And I picked value "052" and "טלפון נייד"
#    And I write "4075877" in "טלפון נייד"
#    Then I click on "next" button
#
#  Scenario:DogHoldingLic step 2
#    #fill second step to go to the next step
#    Given I navigate to "DogHoldingLic" page
#    When I write "ווסאם" in "שם קבלן/ ספק:"
#    And I choice value "מ''ז" in "identityType"
#    And I write "331212324" in "contractorId"
#    And I write "ווסאם" in " תחומי התמחות:"
#    And I write "ירושלים" in "כתובת:"
#    And I write "0524075877" in "טלפון במשרד:"
#    Then I click on "next" button


  Scenario: add file
    Given I navigate to "DogHoldingLic" page
    When i click to add file in "צילום תעודת זהות"
    And select the file
    Then  check if "file" delete button
    And check if this type is pdf or jpeg
    And  check if "file" error is "סוג קובץ אינו חוקי"
    And check if this less then 6m
    And  check if "צילום תעודת זהות" error is "נא לצרף קובץ"


  Scenario: accepted check
    Given I navigate to "DogHoldingLic" page
    When  check if area accepted check is available
    Then click in accepted check
    When check if accepted check selected
    Then click in "next" button


  Scenario : save form
    Given I navigate to "DogHoldingLic" page
    When I click on header "שמור" button
    And save all input field values
    And save page step
    Then check "massage" and "date" saved form
    When click ok massage alert
    Then check page step
    And check all input field values


  Scenario : print page
    Given I navigate to "DogHoldingLic" page
    When I click on header "הדפס" button
    Then check preview page
    When click "action"


