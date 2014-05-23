require 'fileutils'

class BalanceStore
  def balance
    File.read("balance").to_i
  end

  def balance=(new_balance)
    File.open "balance", "w" do |file|
      file.puts new_balance
    end
  end
end
