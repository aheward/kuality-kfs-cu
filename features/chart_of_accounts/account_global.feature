Feature: Global Account

  [KFSQA-604] As a KFS Fiscal Officer I need to perform a lookup on the Major Reporting Category Code field
              because I need to manage in-year financial activity, fund balances and year-end reporting.
  [KFSQA-572] As a KFS Chart Manager I want create a Account Global Maintenance document with a Major Reporting Category,
  because it is a Cornell specific field.
  [KFSQA-577] As a KFS Chart Manager I want to add multiple account lines to the Account Global using Organizational Codes
              because this will save me time.
  [KFSQA-618] As a KFS Fiscal Officer I need to create an account with a Major Reporting Category Code field
              because I need to manage in-year financial activity, fund balances and year-end reporting.

  @KFSQA-604
  Scenario: KFS User lookup on Major Reporting Category Code
    Given I am logged in as a KFS Fiscal Officer
    And   I create an Account Global Maintenance document
    And   I perform a Major Reporting Category Code Lookup
    Then  I should see a list of Major Reporting Category Codes

  @KFSQA-572
  Scenario: Create Account Global Maintenance document with Major Reporting Category Code
    Given I am logged in as a KFS Chart Manager
    When  I create a Account Global Maintenance document with a Major Reporting Category Code of FACULTY
    And   I submit the Account Global Maintenance document
    Then  The Account Global Maintenance document will become FINAL

  @KFSQA-577
  Scenario: Create an Account Global using an organization hierarchy
    Given I am logged in as a KFS Chart Manager
    And   I create an Account Global Maintenance document with multiple accounting lines
    When  I submit the Account Global Maintenance document
    Then  The Account Global Maintenance document will become FINAL

  @KFSQA-618
  Scenario: KFS Chart Manager create an Account Global Maintenance document with a invalid Major Reporting Category Code
    Given I am logged in as a KFS Chart Manager
    When  I create a Account Global Maintenance document with a Major Reporting Category Code of INVALID
    And   I submit the Account Global Maintenance document
    Then  account global should show an error that says "The specified Major Reporting Category Code does not exist."
    When  I enter a valid Major Reporting Category Code of FACULTY
    And   I submit the Account Global Maintenance document
    Then  The Account Global Maintenance document will become FINAL

