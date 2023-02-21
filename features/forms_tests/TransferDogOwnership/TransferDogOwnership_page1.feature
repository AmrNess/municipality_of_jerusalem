Feature: Test for TransferDogOwnership Form Page

  @Header
  Scenario: check form explanation
    Given I navigate to "TransferDogOwnership" page
    Then check the explanation tittle
    And check the explanation body



    """New Owner"""

  @critical
  Scenario Outline: id check valid
    # check id field with valid values
    Given I navigate to "TransferDogOwnership" page
    When I write "<id>" in "מספר ת.ז." for "receiver"
    Then field "מספר ת.ז." for "receiver" has Valid value
    And  check if "מספר ת.ז." for "receiver" error is "מספר זהות שגוי"
    Then clear "מספר ת.ז." for "receiver" field
    Examples:
      | id        |
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

  Scenario Outline: id check invalid
     # check id field with invalid values
    Given I navigate to "TransferDogOwnership" page
    When I write "<id>" in "מספר ת.ז." for "receiver"
    Then field "מספר ת.ז." for "receiver" has inValid value
    And  check if "מספר ת.ז." for "receiver" error is "NotNumber_error"
    Then clear "מספר ת.ז." for "receiver" field
    Examples:
      | id                         |
      |                            |
      | 000000000                  |
      | 000000001                  |
      | 000000118                  |
      | 000000009                  |
      | 3121                       |
      | 34379818234336234724282    |
      | 92443232                   |
      | salem12321342133           |
      | salem12343457893r44677458  |
      | 83427961833                |
      | 3219                       |
      | 8883                       |
      | 0157                       |
      | 0180                       |
      | 22345556754                |
      | 23e23444322343355          |
      | 33sham344557895            |
      | 33ק'/דגגבשד344554897       |
      | 33ק'سببسث344567897         |
      | 33ק'/דגגכבבשד34557897      |
      | 33!@#$%3445765897          |
      | 33زسيhhjכעיח!@#$%344557457 |
      | 331133232ssd24312233       |
      | 01                         |
      | 231312324                  |
      | 453344553                  |
      | 612235427                  |
      | 322314466                  |
      | 613167101                  |
      | 213141517                  |
      | 293942999                  |
      | 135416541                  |
      | 224222424                  |
      | 108102581                  |
      | 233243236                  |
      | 154528136                  |
      | 160786030                  |
      #BUG
      | 1111111                    |
      | 12344                      |
      | 2222222                    |
      | 3333333                    |
      | 4444444                    |
      | 8888                       |
      | 1313                       |
      | 141                        |
      | 117                        |
      | 1115                       |

#BUG: first name and last name take infinity character
  Scenario Outline: first name check valid
    #check with valed names
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "שם פרטי" for "receiver"
    Then field "שם פרטי" for "receiver" has valid value
    And  check if "שם פרטי" for "receiver" error is "language_error"
    And clear "שם פרטי" for "receiver" field
    Examples:
      | text        |
      | ווסאם       |
      | יחלךףחיס    |
      | .יחלךףחיס   |
      | יחלךףחיס\   |
      | יחלךףחיס()- |
      | יחלךףחיס_   |
      | יחלךףחיס,   |
      | יחלךףחיס    |


  Scenario Outline: first name check invalid
    #check with invaled names
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "שם פרטי" for "receiver"
    Then field "שם פרטי" for "receiver" has inValid value
    And  check if "שם פרטי" for "receiver" error is "language_error"
    Then clear "שם פרטי" for "receiver" field
    Examples:
      | text              |
      | אבגד/()'.,_-זחט12 |
      | אבגד/()'.,_-זחט!  |
      | אבגד/()'.,_-זחט@  |
      | אבגד/()'.,_-זחט#  |
      | אבגד/()'.,_-זחט$  |
      | אבגד/()'.,_-זחט%  |
      | אבגד/()'.,_-זחט^  |
      | אבגד/()'.,_-זחט&  |
      | אבגד/()'.,_-זחט*  |
      | אבגד/()'.,_-זחט+  |
      | אבג/12            |
      | דהו!              |
      | זחט@              |
      | יכל#              |
      | מנס$              |
      | פצק%              |
      | רשת^              |
      | בגדי&             |
      | הוזח*             |
      | לכמנ+             |
      | אבג/12            |
      | דהו!              |
      | זחט@              |
      | יכל#              |
      | מנס$              |
      | פצק%              |
      | רשת^              |
      | בגדי&             |
      | הוזח*             |
      | לכמנ+             |
      | אבג/()            |
      | רשת12             |
      | בגדי!             |
      | הוזח@             |
      | לכמנ#             |
      | يصييس             |
      | وسام@             |
      | محمد3             |


  Scenario Outline: last name check valid
    #check with valed names
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "שם משפחה" for "receiver"
    Then field "שם משפחה" for "receiver" has valid value
    And  check if "שם משפחה" for "receiver" error is "language_error"
    Then clear "שם משפחה" for "receiver" field
    Examples:
      | text        |
      | ווסאם       |
      | יחלךףחיס    |
      #BUG:
      | .יחלךףחיס   |
      | יחלךףחיס\   |
      | יחלךףחיס()- |
      | יחלךףחיס_   |
      | יחלךףחיס,   |
      | יחלךףחיס    |

  Scenario Outline: last name check invalid
    #check with invaled names
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "שם משפחה" for "receiver"
    Then field "שם משפחה" for "receiver" has inValid value
    And  check if "שם משפחה" for "receiver" error is "language_error"
    Then clear "שם משפחה" for "receiver" field
    Examples:
      | text              |
      | אבגד/()'.,_-זחט12 |
      | אבגד/()'.,_-זחט!  |
      | אבגד/()'.,_-זחט@  |
      | אבגד/()'.,_-זחט#  |
      | אבגד/()'.,_-זחט$  |
      | אבגד/()'.,_-זחט%  |
      | אבגד/()'.,_-זחט^  |
      | אבגד/()'.,_-זחט&  |
      | אבגד/()'.,_-זחט*  |
      | אבגד/()'.,_-זחט+  |
      | אבג/12            |
      | דהו!              |
      | זחט@              |
      | יכל#              |
      | מנס$              |
      | פצק%              |
      | רשת^              |
      | בגדי&             |
      | הוזח*             |
      | לכמנ+             |
      | אבג/12            |
      | דהו!              |
      | זחט@              |
      | יכל#              |
      | מנס$              |
      | פצק%              |
      | רשת^              |
      | בגדי&             |
      | הוזח*             |
      | לכמנ+             |
      | אבג/()            |
      | רשת12             |
      | בגדי!             |
      | הוזח@             |
      | לכמנ#             |
      | يصييس             |
      | وسام@             |
      | محمد3             |


  Scenario Outline: email check valid
    #check with valed emails
    Given I navigate to "TransferDogOwnership" page
    When I write "<email>" in 'דוא"ל' for "receiver"
    Then field 'דוא"ל' for "receiver" has valid value
    And  check if 'דוא"ל' for "receiver" error is "email_error"
    Then clear 'דוא"ל' for "receiver" field
    Examples:
      | email             |
      | sda32sd@dyj.com   |
      | rtyu@sd.com       |
      | qw@hj.com         |
      | qw@hj.asd.com     |
      | qwd@d.com         |
      | assd@b.sas.com    |
      | asasd@grgb.com    |
      | aqaws@bfew.com    |
      | fewfas@fefsab.com |
      | awdas@efadsb.com  |


  Scenario Outline: emails check invalid
    #check with invaled emails
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in 'דוא"ל' for "receiver"
    Then field 'דוא"ל' for "receiver" has inValid value
    And  check if 'דוא"ל' for "receiver" error is "email_error"
    Then clear 'דוא"ל' for "receiver" field

    Examples:
      | text                      |
      | אבגד/()'.,_-זחט12         |
      | אבגד/()'.,_-זחט!          |
      | אבגד/()'.,_-זחט@          |
      | אבגד/()'.,_-זחט#          |
      | אבגד/()'.,_-זחט$          |
      | אבגד/()'.,_-זחט%          |
      | אבגד/()'.,_-זחט^          |
      | אבגד/()'.,_-זחט&          |
      | אבגד/()'.,_-זחט*          |
      | אבגד/()'.,_-זחט+          |
      | אבג/12                    |
      | דהו!                      |
      | זחט@                      |
      | יכל#                      |
      | מנס$                      |
      | פצק%                      |
      | רשת^                      |
      | בגדי&                     |
      | הוזח*                     |
      | לכמנ+                     |
      | אבג/12                    |
      | דהו!                      |
      | זחט@                      |
      | יכל#                      |
      | מנס$                      |
      | פצק%                      |
      | רשת^                      |
      | בגדי&                     |
      | הוזח*                     |
      | לכמנ+                     |
      | אבג/()                    |
      | רשת12                     |
      | בגדי!                     |
      | הוזח@                     |
      | לכמנ#                     |
      | يصييس                     |
      | وسام@                     |
      | محمد3                     |
      | a@b...דג..............com |
      | 2w@w.....com              |
      | a@b.com.12سيsd#%          |
      | aس@b.com                  |
      | A@f@h$.com                |
      | a.b@c.d@d.com             |
      | dgh.@gjj.com              |
      | dfghj.dfghj@@j.com        |
      #BUG:
      | a@b.com.com.com.com       |
      | a@b.com.com.comcccc.com   |
      | A@B.COM                   |
      | a%@b.com                  |
      | a_----___---_____r@b.com  |
      | a+r@b.com                 |
      | A@b.cOm                   |
      | w@w                       |
      | 2w@w.com                  |
      | a@b.com.سيسي              |
      | A$h@B.com                 |


  Scenario Outline: phone three number check valid
    Given I navigate to "TransferDogOwnership" page
    When I picked value "<text>" and "dropDownPhone" for "receiver"
    And  check if "dropDownPhone" for "receiver" error is "wrong_choice"
    Then clear "dropDownPhone" for "receiver" field

    Examples:
      | text |
      | 050  |
      | 052  |
      | 053  |
      | 054  |
      | 055  |
      | 056  |
      | 057  |
      | 058  |
      | 077  |
      | 051  |
      | 059  |

  Scenario Outline: phone three number check inValid
    Given I navigate to "TransferDogOwnership" page
    When I picked value "<text>" and "dropDownPhone" for "receiver"
    And  check if "dropDownPhone" for "receiver" error is "wrong_choice"
    Then clear "dropDownPhone" for "receiver" field
    Examples:
      | text |
      | 02   |
      | 001  |
      | 123  |


  Scenario Outline: phone number check valid
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "טלפון נייד" for "receiver"
    Then field "טלפון נייד" for "receiver" has valid value
    And  check if "טלפון נייד" for "receiver" error is "NotNumber_error"
    Then clear "טלפון נייד" for "receiver" field
    Examples:
      | text    |
      | 1212131 |
      | 4075877 |
      | 3333333 |

  Scenario Outline: phone number check invalid
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "טלפון נייד" for "receiver"
    Then field "טלפון נייד" for "receiver" has inValid value
    And  check if "טלפון נייד" for "receiver" error is "NotNumber_error"
    Examples:
      | text        |
      | ווסאם       |
      | ווס 22אם    |
      | asdasd      |
      | @Dd$WDC223  |
      | number      |
      | sjh-skjsksj |
      | sdsasasdd   |
      | gregwe$%f   |
      | @#$%^&*(7   |
      | 1111        |
      |             |

  Scenario: check the city is disabled
    Given I navigate to "TransferDogOwnership" page
    Then field "יישוב:" for "receiver" is disabled
    And  check if "יישוב:" for "receiver" had "ירושלים" value


  Scenario Outline: street name choised valid
    Given I navigate to "TransferDogOwnership" page
    When I scroll to value "<street>" in "רחוב:" for "receiver"
    Then field "רחוב:" for "receiver" has valid value
    Examples:
      | street |
      | א טור  |
      | חרובה  |

  Scenario Outline: street name choised invalid
    Given I navigate to "TransferDogOwnership" page
    When I scroll to value "<street>" in "רחוב:" for "receiver"
    Then field "רחוב:" for "receiver" has inValid value
    Examples:
      | street |
      | טור    |
      | בה     |


  Scenario Outline: home number valid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "מספר בית" for "receiver"
    Then field "מספר בית" for "receiver" has valid value
    And  check if "מספר בית" for "receiver" error is "NotNumber_error"
    Then clear "מספר בית" for "receiver" field
    Examples:
      | text |
      | 1    |
      | 11   |
      | 12   |
      | 24   |

  Scenario Outline: home number invalid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "מספר בית" for "receiver"
    Then field "מספר בית" for "receiver" has inValid value
    And  check if "מספר בית" for "receiver" error is "NotNumber_error"
    Then clear "מספר בית" for "receiver" field
    Examples:
      | text                                                      |
      |                                                           |
      #BUG
      | 111111111111111111111111111111111111111111111111111111111 |


  Scenario Outline: Apartment number valid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "מספר דירה" for "receiver"
    Then field "מספר דירה" for "receiver" has valid value
    And  check if "מספר דירה" for "receiver" error is "NotNumber_error"
    Then clear "מספר דירה" for "receiver" field
    Examples:
      | text |
      | 1    |
      | 11   |
      | 12   |
      | 24   |

  Scenario Outline: Apartment number invalid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "מספר דירה" for "receiver"
    Then field "מספר דירה" for "receiver" has inValid value
    And  check if "מספר דירה" for "receiver" error is "NotNumber_error"
    Then clear "מספר דירה" for "receiver" field
    Examples:
      | text                                                      |
      |                                                           |
      #BUG
      | 111111111111111111111111111111111111111111111111111111111 |



  Scenario Outline: PO Box number valid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "ת.ד.:" for "receiver"
    Then field "ת.ד.:" for "receiver" has valid value
    And  check if "ת.ד.:" for "receiver" error is "NotNumber_error"
    Then clear "ת.ד.:" for "receiver" field
    Examples:
      | text |
      | 1    |
      | 11   |
      | 12   |
      | 24   |

  Scenario Outline: PO Box number invalid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "ת.ד.:" for "receiver"
    Then field "ת.ד.:" for "receiver" has inValid value
    And  check if "ת.ד.:" for "receiver" error is "NotNumber_error"
    Then clear "ת.ד.:" for "receiver" field
    Examples:
      | text                                                      |
      |                                                           |
      #BUG
      | 111111111111111111111111111111111111111111111111111111111 |


  """OldOwner"""


  #BUG: first name and last name take infinity character
  Scenario Outline: first name check valid
    #check with valed names
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "שם פרטי" for "OldOwner"
    Then field "שם פרטי" for "OldOwner" has valid value
    And  check if "שם פרטי" for "OldOwner" error is "language_error"
    And clear "שם פרטי" for "OldOwner" field
    Examples:
      | text        |
      | ווסאם       |
      | יחלךףחיס    |
      | .יחלךףחיס   |
      | יחלךףחיס\   |
      | יחלךףחיס()- |
      | יחלךףחיס_   |
      | יחלךףחיס,   |
      | יחלךףחיס    |


  Scenario Outline: first name check invalid
    #check with invaled names
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "שם פרטי" for "OldOwner"
    Then field "שם פרטי" for "OldOwner" has inValid value
    And  check if "שם פרטי" for "OldOwner" error is "language_error"
    Then clear "שם פרטי" for "OldOwner" field
    Examples:
      | text              |
      | אבגד/()'.,_-זחט12 |
      | אבגד/()'.,_-זחט!  |
      | אבגד/()'.,_-זחט@  |
      | אבגד/()'.,_-זחט#  |
      | אבגד/()'.,_-זחט$  |
      | אבגד/()'.,_-זחט%  |
      | אבגד/()'.,_-זחט^  |
      | אבגד/()'.,_-זחט&  |
      | אבגד/()'.,_-זחט*  |
      | אבגד/()'.,_-זחט+  |
      | אבג/12            |
      | דהו!              |
      | זחט@              |
      | יכל#              |
      | מנס$              |
      | פצק%              |
      | רשת^              |
      | בגדי&             |
      | הוזח*             |
      | לכמנ+             |
      | אבג/12            |
      | דהו!              |
      | זחט@              |
      | יכל#              |
      | מנס$              |
      | פצק%              |
      | רשת^              |
      | בגדי&             |
      | הוזח*             |
      | לכמנ+             |
      | אבג/()            |
      | רשת12             |
      | בגדי!             |
      | הוזח@             |
      | לכמנ#             |
      | يصييس             |
      | وسام@             |
      | محمد3             |


  Scenario Outline: last name check valid
    #check with valed names
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "שם משפחה" for "OldOwner"
    Then field "שם משפחה" for "OldOwner" has valid value
    And  check if "שם משפחה" for "OldOwner" error is "language_error"
    Then clear "שם משפחה" for "OldOwner" field
    Examples:
      | text        |
      | ווסאם       |
      | יחלךףחיס    |
      #BUG:
      | .יחלךףחיס   |
      | יחלךףחיס\   |
      | יחלךףחיס()- |
      | יחלךףחיס_   |
      | יחלךףחיס,   |
      | יחלךףחיס    |

  Scenario Outline: last name check invalid
    #check with invaled names
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "שם משפחה" for "OldOwner"
    Then field "שם משפחה" for "OldOwner" has inValid value
    And  check if "שם משפחה" for "OldOwner" error is "language_error"
    Then clear "שם משפחה" for "OldOwner" field
    Examples:
      | text              |
      | אבגד/()'.,_-זחט12 |
      | אבגד/()'.,_-זחט!  |
      | אבגד/()'.,_-זחט@  |
      | אבגד/()'.,_-זחט#  |
      | אבגד/()'.,_-זחט$  |
      | אבגד/()'.,_-זחט%  |
      | אבגד/()'.,_-זחט^  |
      | אבגד/()'.,_-זחט&  |
      | אבגד/()'.,_-זחט*  |
      | אבגד/()'.,_-זחט+  |
      | אבג/12            |
      | דהו!              |
      | זחט@              |
      | יכל#              |
      | מנס$              |
      | פצק%              |
      | רשת^              |
      | בגדי&             |
      | הוזח*             |
      | לכמנ+             |
      | אבג/12            |
      | דהו!              |
      | זחט@              |
      | יכל#              |
      | מנס$              |
      | פצק%              |
      | רשת^              |
      | בגדי&             |
      | הוזח*             |
      | לכמנ+             |
      | אבג/()            |
      | רשת12             |
      | בגדי!             |
      | הוזח@             |
      | לכמנ#             |
      | يصييس             |
      | وسام@             |
      | محمد3             |


  @critical
  Scenario Outline: id check valid
    # check id field with valid values
    Given I navigate to "TransferDogOwnership" page
    When I write "<id>" in "מספר ת.ז." for "OldOwner"
    Then field "מספר ת.ז." for "OldOwner" has Valid value
    And  check if "מספר ת.ז." for "OldOwner" error is "מספר זהות שגוי"
    Then clear "מספר ת.ז." for "OldOwner" field
    Examples:
      | id        |
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

  Scenario Outline: id check invalid
     # check id field with invalid values
    Given I navigate to "TransferDogOwnership" page
    When I write "<id>" in "מספר ת.ז." for "OldOwner"
    Then field "מספר ת.ז." for "OldOwner" has inValid value
    And  check if "מספר ת.ז." for "OldOwner" error is "NotNumber_error"
    Then clear "מספר ת.ז." for "OldOwner" field
    Examples:
      | id                         |
      |                            |
      | 000000000                  |
      | 000000001                  |
      | 000000118                  |
      | 000000009                  |
      | 3121                       |
      | 34379818234336234724282    |
      | 92443232                   |
      | salem12321342133           |
      | salem12343457893r44677458  |
      | 83427961833                |
      | 3219                       |
      | 8883                       |
      | 0157                       |
      | 0180                       |
      | 22345556754                |
      | 23e23444322343355          |
      | 33sham344557895            |
      | 33ק'/דגגבשד344554897       |
      | 33ק'سببسث344567897         |
      | 33ק'/דגגכבבשד34557897      |
      | 33!@#$%3445765897          |
      | 33زسيhhjכעיח!@#$%344557457 |
      | 331133232ssd24312233       |
      | 01                         |
      | 231312324                  |
      | 453344553                  |
      | 612235427                  |
      | 322314466                  |
      | 613167101                  |
      | 213141517                  |
      | 293942999                  |
      | 135416541                  |
      | 224222424                  |
      | 108102581                  |
      | 233243236                  |
      | 154528136                  |
      | 160786030                  |
      #BUG
      | 1111111                    |
      | 12344                      |
      | 2222222                    |
      | 3333333                    |
      | 4444444                    |
      | 8888                       |
      | 1313                       |
      | 141                        |
      | 117                        |
      | 1115                       |


  Scenario Outline: phone three number check valid
    Given I navigate to "TransferDogOwnership" page
    When I picked value "<text>" and "dropDownPhone" for "OldOwner"
    And  check if "dropDownPhone" for "OldOwner" error is "wrong_choice"
    Then clear "dropDownPhone" for "OldOwner" field

    Examples:
      | text |
      | 050  |
      | 052  |
      | 053  |
      | 054  |
      | 055  |
      | 056  |
      | 057  |
      | 058  |
      | 077  |
      | 051  |
      | 059  |

  Scenario Outline: phone three number check inValid
    Given I navigate to "TransferDogOwnership" page
    When I picked value "<text>" and "dropDownPhone" for "OldOwner"
    And  check if "dropDownPhone" for "OldOwner" error is "wrong_choice"
    Then clear "dropDownPhone" for "OldOwner" field
    Examples:
      | text |
      | 02   |
      | 001  |
      | 123  |


  Scenario Outline: phone number check valid
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "טלפון נייד" for "OldOwner"
    Then field "טלפון נייד" for "OldOwner" has valid value
    And  check if "טלפון נייד" for "OldOwner" error is "NotNumber_error"
    Then clear "טלפון נייד" for "OldOwner" field
    Examples:
      | text    |
      | 1212131 |
      | 4075877 |
      | 3333333 |

  Scenario Outline: phone number check invalid
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "טלפון נייד" for "OldOwner"
    Then field "טלפון נייד" for "OldOwner" has inValid value
    And  check if "טלפון נייד" for "OldOwner" error is "NotNumber_error"
    Examples:
      | text        |
      | ווסאם       |
      | ווס 22אם    |
      | asdasd      |
      | @Dd$WDC223  |
      | number      |
      | sjh-skjsksj |
      | sdsasasdd   |
      | gregwe$%f   |
      | @#$%^&*(7   |
      | 1111        |
      |             |
    #BUG: field take the all
  Scenario Outline: city valid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "יישוב:" for "OldOwner"
    Then field "יישוב:" for "OldOwner" has valid value
    Then clear "יישוב:" for "OldOwner" field
    Examples:
      | text    |
      | ירושלים |
      | חיפה    |


    #BUG: field take the all
  Scenario Outline: city invalid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "יישוב:" for "OldOwner"
    Then field "יישוב:" for "OldOwner" has inValid value
    Then clear "יישוב:" for "OldOwner" field
    Examples:
      | text                                                      |
       #BUG
      |                                                           |
      | 111111111111111111111111111111111111111111111111111111111 |

    #BUG: field take the all
  Scenario Outline: street name choised valid
    Given I navigate to "TransferDogOwnership" page
    When I scroll to value "<street>" in "רחוב:" for "OldOwner"
    Then field "רחוב:" for "OldOwner" has valid value
    Examples:
      | street |
      | א טור  |
      | חרובה  |
    #BUG: field take the all
  Scenario Outline: street name choised invalid
    Given I navigate to "TransferDogOwnership" page
    When I scroll to value "<street>" in "רחוב:" for "OldOwner"
    Then field "רחוב:" for "OldOwner" has inValid value
    Examples:
      | street |
      | טור    |
      | בה     |


  Scenario Outline: home number valid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "מספר בית" for "OldOwner"
    Then field "מספר בית" for "OldOwner" has valid value
    And  check if "מספר בית" for "OldOwner" error is "NotNumber_error"
    Then clear "מספר בית" for "OldOwner" field
    Examples:
      | text |
      | 1    |
      | 11   |
      | 12   |
      | 24   |

  Scenario Outline: home number invalid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "מספר בית" for "OldOwner"
    Then field "מספר בית" for "OldOwner" has inValid value
    And  check if "מספר בית" for "OldOwner" error is "NotNumber_error"
    Then clear "מספר בית" for "OldOwner" field
    Examples:
      | text                                                      |
      |                                                           |
      #BUG
      | 111111111111111111111111111111111111111111111111111111111 |


  Scenario Outline: Apartment number valid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "מספר דירה" for "OldOwner"
    Then field "מספר דירה" for "OldOwner" has valid value
    And  check if "מספר דירה" for "OldOwner" error is "NotNumber_error"
    Then clear "מספר דירה" for "OldOwner" field
    Examples:
      | text |
      | 1    |
      | 11   |
      | 12   |
      | 24   |

  Scenario Outline: Apartment number invalid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "מספר דירה" for "OldOwner"
    Then field "מספר דירה" for "OldOwner" has inValid value
    And  check if "מספר דירה" for "OldOwner" error is "NotNumber_error"
    Then clear "מספר דירה" for "OldOwner" field
    Examples:
      | text                                                      |
      |                                                           |
      #BUG
      | 111111111111111111111111111111111111111111111111111111111 |


  Scenario Outline: PO Box number valid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "ת.ד.:" for "OldOwner"
    Then field "ת.ד.:" for "OldOwner" has valid value
    And  check if "ת.ד.:" for "OldOwner" error is "NotNumber_error"
    Then clear "ת.ד.:" for "OldOwner" field
    Examples:
      | text |
      | 1    |
      | 11   |
      | 12   |
      | 24   |

  Scenario Outline: PO Box number invalid check
    Given I navigate to "TransferDogOwnership" page
    When I write "<text>" in "ת.ד.:" for "OldOwner"
    Then field "ת.ד.:" for "OldOwner" has inValid value
    And  check if "ת.ד.:" for "OldOwner" error is "NotNumber_error"
    Then clear "ת.ד.:" for "OldOwner" field
    Examples:
      | text                                                      |
      |                                                           |
      #BUG
      | 111111111111111111111111111111111111111111111111111111111 |


  Scenario Outline: chack all the fields
    Given I navigate to "DogHoldingLic" page
    When check the explanation tittle
    And check the explanation body
    """receiver"""
    When I write "<id>" in "מספר ת.ז." for "receiver"
    And I write "<fname>" in "שם פרטי" for "receiver"
    And I write "<lname>" in "שם משפחה" for "receiver"
    And I write "<email>" in "דוא"ל" for "receiver"
    And I picked value "<3num>" and "טלפון נייד" for "receiver"
    And I write "<phone>" in "טלפון נייד" for "receiver"
    And I scroll to value "<street>" in "רחוב:" for "receiver"
    And I write "<homeNum>" in "מספר בית" for "receiver"
    And I write "<aprNum>" in "מספר דירה:" for "receiver"
    And I write "<poBox>" in "ת.ד.:" for "receiver"
    """oldOwner"""
    When I write "<fnameOld>" in "שם פרטי" for "OldOwner"
    And I write "<lnameOld>" in "שם משפחה" for "OldOwner"
    And I write "<idOld>" in "מספר ת.ז." for "OldOwner"
    And I picked value "<3numOld>" and "טלפון נייד" for "OldOwner"
    And I write "<phoneOld>" in "טלפון נייד" for "OldOwner"
    And I write "<cityOld>" in "יישוב:" for "OldOwner"
    And I write "<streetOld>" in "רחוב:" for "OldOwner"
    And I write "<homeNumOld>" in "מספר בית" for "OldOwner"
    And I write "<aprNumOld>" in "מספר דירה:" for "OldOwner"
    And I write "<poBoxOld>" in "ת.ד.:" for "OldOwner"
    Then I click on "next" button
    Examples:
      | id        | fname    | lname    | email   | 3num    | phone    | street    | homeNum    | aprNum    | poBox    |
      |           |          |          |         |         |          |           |            |           |          |
      | 111111100 | ווסאם    | עוקה     | w@w.com | 052     |          | 3         | 3          | 3         | 3        |
      | 111111100 | ווסאם    | עוקה     | w@w.com |         | 4075877  | 3         | 3          | 3         |          |
      | 111111100 | ווסאם    | עוקה     |         | 052     | 4075877  | 3         | 3          |           | 3        |
      | 111111100 | ווסאם    |          | w@w.com | 052     | 4075877  | 3         |            | 3         | 3        |
      | 111111100 |          | עוקה     | w@w.com | 052     | 4075877  |           | 3          | 3         |          |
      |           | ווסאם    | עוקה     | w@w.com | 052     |          | 3         | 3          | 3         | 3        |

      | idOld     | fnameOld | lnameOld | cityOld | 3numOld | phoneOld | streetOld | homeNumOld | aprNumOld | poBoxOld |
      |           |          |          |         |         |          |           |            |           |          |
      | 111111100 | ווסאם    | עוקה     | w@w.com | 052     |          | 3         | 3          | 3         | 2        |
      | 111111100 | ווסאם    | עוקה     | w@w.com |         | 4075877  | 3         | 3          | 3         |          |
      | 111111100 | ווסאם    | עוקה     |         | 052     | 4075877  | 3         | 3          |           | 3        |
      | 111111100 | ווסאם    |          | w@w.com | 052     | 4075877  | 3         |            | 3         | 3        |
      | 111111100 |          | עוקה     | w@w.com | 052     | 4075877  |           | 3          |           |          |
      |           | ווסאם    | עוקה     | w@w.com | 052     |          | 3         | 2          | 2         | 2        |

  @Header
  Scenario : save form
    Given I navigate to "TransferDogOwnership" page
    When I click on header "שמור" button
    And save all input field values
    And save page step
    Then check "massage" and "date" saved form
    When click ok massage alert
    Then check page step
    And check all input field values

  @Header
  Scenario : print page
    Given I navigate to "TransferDogOwnership" page
    When I click on header "הדפס" button
    Then check preview page
    When click "action"
