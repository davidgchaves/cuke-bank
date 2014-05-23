require_relative 'transaction_queue'
require_relative 'account'

transaction_queue = TransactionQueue.new

puts "Transaction processor ready"

loop do
  transaction_queue.read do |message|
    sleep 1
    transaction_amount, account_number = message.split /,/
    account = Account.find_by_number! account_number.strip
    new_balance = account.balance + transaction_amount.to_i
    account.balance = new_balance
    account.save
  end
end
