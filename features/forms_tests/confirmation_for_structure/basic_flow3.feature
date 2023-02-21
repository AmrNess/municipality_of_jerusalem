Feature: Basic Test for ConfirmationForStructure

  Scenario Outline: Testing if elements are existed
    Given I navigate to "ConfirmationForStructure" page
    When I write element "<text>" in "PageItems" and "<discription>"
    Examples:
      | text                                                                  | discription                                              |
      | //img[@src="Scripts/assets/images/main-logo.svg"]                     | Page logo                                                |
      | //a[@href="https://www.jerusalem.muni.il/"]                           | Municipality Link                                        |
      | //li/a[contains(text(),'עברית')]                                      | Hebrew lang.                                             |
      | //li/a[contains(text(),'لعربية')]                                     | Arabic lang.                                             |
      | //h1                                                                  | Page title                                               |
      | //h                                                                   | No such element ( just to check the validity of the test |
      | //span[contains(text(),'פרטי מגיש הבקשה')]                            | First Page icon                                          |
      | //span[contains(text(),'פרטי הנכס')]                                  | Second page icon                                         |
      | //span[contains(text(),'הזדהות ושליחה')]                              | Third page icon                                          |
      | //div[@class="form-explanation ng-tns-c32-0 ng-star-inserted"]/div[1] | Form explanation text                                    |
      | //span[contains(text(),'המשך')]                                       | Continue button                                          |
      | //button[@id="INDmenu-btn"]                                           | disabled button                                          |
      | //div[contains(text(),'לתמיכה טכנית צרו איתנו קשר')]                  | footer note                                              |




#Feature: Basic Test for ConfirmationForStructure Form Page 222
#  # Enter feature description here
#
#  Scenario: check header foter
#    Given I navigate to "ConfirmationForStructure" page
#    When I check header
#    And I check footer
#    Then the head should be displayed
#    And the footer should be displayed


