require 'fileutils'

class TransactionQueue
  def self.clear
    FileUtils.rm_rf "messages"
    FileUtils.mkdir_p "messages"
  end

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
