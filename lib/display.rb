class Display
  attr_reader :list, :log

  def initialize(transaction_log = TransactionLog.new)
    @log = transaction_log
    @list = transaction_log.list
  end
end
