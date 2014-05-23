require 'fileutils'

class BalanceStore
  def balance
    File.read("balance").to_i
  end
end
