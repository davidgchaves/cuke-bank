require 'fileutils'

class TransactionQueue
  def initialize
    @next_id = 1
  end

  def write(transaction)
    File.open "messages/#{@next_id}", "w" do |file|
      file.puts transaction
    end
    @next_id += 1
  end
end
