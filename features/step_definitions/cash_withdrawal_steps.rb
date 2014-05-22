# TODO LIST:
# - We need to implement the Account properly, with unit tests
# - We need to implement the Teller properly, with unit tests
# - We need to implement the CashSlot properly, with unit tests
# - Do we really need amount as an argument to the Teller's withdraw_from method?

class Account
  def deposit(amount)
    @balance = amount
  end

  def balance
    @balance
  end
end

class Teller
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end

  def withdraw_from(account, amount)
    @cash_slot.dispense amount
  end
end

class CashSlot
  def contents
    @contents or raise("I'm empty!")
  end

  def dispense(amount)
    @contents = amount
  end
end

module KnowsMyDomain
  def my_account
    @my_account ||= Account.new
  end

  def cash_slot
    @cash_slot ||= CashSlot.new
  end

  def teller
    @teller ||= Teller.new cash_slot
  end
end

World KnowsMyDomain

CAPTURE_CASH_AMOUNT = Transform /^\$(\d+)$/ do |digits|
  digits.to_i
end

Given /^I have deposited (#{CAPTURE_CASH_AMOUNT}) in my account$/ do |amount|
  my_account.deposit amount
  expect(my_account.balance).to eq(amount),
    "Expected the balance to be #{amount} but it was #{my_account.balance}"
end

When /^I withdraw (#{CAPTURE_CASH_AMOUNT})/ do |amount|
  teller.withdraw_from my_account, amount
end

Then /(#{CAPTURE_CASH_AMOUNT}) are dispensed$/ do |amount|
  expect(cash_slot.contents).to eq amount
end
