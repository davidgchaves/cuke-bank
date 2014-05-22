# TODO LIST:
# - We need to implement the Account properly, with unit tests
# - We need to implement the Teller properly, with unit tests
# - We need to implement the CashSlot properly, with unit tests
# - Do we really need amount as an argument to the Teller's withdraw_from method?

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
