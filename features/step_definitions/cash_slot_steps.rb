Then /(#{CAPTURE_CASH_AMOUNT}) are dispensed$/ do |amount|
  expect(cash_slot.contents).to eq amount
end
