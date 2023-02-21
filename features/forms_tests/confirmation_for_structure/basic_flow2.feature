# Created by Amr.Shaloudi at 28/01/23
Feature: Basic Test for ConfirmationForStructure Form Page 222
  # Enter feature description here

  Scenario: special needs
    Given I navigate to "ConfirmationForStructure" page
    When I click on "SpecialNeeds" btn
    Then close the menu




    #
#      Scenario: critical basic test
#        Given I navigate to "FreedomInfo" page
#        When I picked value "059" and "dropDownPhone"
#
#
##  Scenario Outline: Testing if elements are existed
##    Given I navigate to "FreedomInfo" page
##    When I write element "<text>" in "PageItems" and "<discription>"
##    Examples:
##      | text                                                                  | discription                                              |
##      | //img[@src="Scripts/assets/images/main-logo.svg"]                     | Page logo                                                |
##      | //a[@href="https://www.jerusalem.muni.il/"]                           | Municipality Link                                        |
##      | //li/a[contains(text(),'עברית')]                                      | Hebrew lang.                                             |
##      | //li/a[contains(text(),'لعربية')]                                     | Arabic lang.                                             |
##      | //h1                                                                  | Page title                                               |
##      | //h                                                                   | No such element ( just to check the validity of the test |
##      | //span[contains(text(),'פרטי מגיש הבקשה')]                            | First Page icon                                          |
##      | //span[contains(text(),'פרטי הנכס')]                                  | Second page icon                                         |
##      | //span[contains(text(),'הזדהות ושליחה')]                              | Third page icon                                          |
##      | //div[@class="form-explanation ng-tns-c32-0 ng-star-inserted"]/div[1] | Form explanation text                                    |
##      | //span[contains(text(),'המשך')]                                       | Continue button                                          |
##      | //button[@id="INDmenu-btn"]                                           | disabled button                                          |
##      | //div[contains(text(),'לתמיכה טכנית צרו איתנו קשר')]                  | footer note                                              |
#
#
#      @critical
#    Scenario: critical basic test
#      Given I navigate to "FreedomInfo" page
#      When I write "ווסאם" in "שם פרטי"
#      And I write "עוקה" in "שם משפחה"
#      And I write "1111111" in "מספר ת.ז."
#      And I picked "052" in "טלפון נייד"
#      And I write "4075877" in "טלפון נייד"
#      And I picked "072" in "טלפון קווי"
#      And I write "4075877" in "טלפון קווי"
#      And I write "w@w.com" in "דוא"ל"
#      Then field "שם פרטי" has valid value
#      Then I click on "המשך" button
#
#
#
##Feature: Basic Test for ConfirmationForStructure Form Page 222
##  # Enter feature description here
##
#  Scenario: check heder footer elements
#    Given I navigate to "ConfirmationForStructure" page
#    When I check header
#    And I check footer
#    Then the head should be displayed
#    And the footer should be displayed





  @critical
#    Scenario: critical basic test
#      Given I navigate to "FreedomInfo" page
#      When I write "ווסאם" in "שם פרטי"
#      And I write "עוקה" in "שם משפחה"
#      And I write "1111111" in "מספר ת.ז."
#      And I picked value "059" and "dropDownPhone"
#      And I write "4075877" in "טלפון נייד"
#  #    And I picked "072" in "טלפון קווי"
#      And I write "4075877" in "טלפון קווי"
#      And I write "w@w.com" in "דוא"ל"
#  #    Then field "שם פרטי" has valid value
#      Then I click on "המשך" button