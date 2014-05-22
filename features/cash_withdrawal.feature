Feature: Cash Withdrawal
  Scenario: Successfully withdrawal from an account in credit
    Given my account has been credited with $100
    When I withdraw $20
    Then $20 are dispensed
    And the balance of my account is $80
