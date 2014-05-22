Feature: Cash Withdrawal
  Scenario: Successfully withdrawal from an account in credit
    Given I have deposited $100 in my account
    When I withdraw $20
    Then $20 are dispensed
    And the balance of my account is $80
