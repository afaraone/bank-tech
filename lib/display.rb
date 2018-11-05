class Display
  attr_reader :list, :sep

  DEFAULT_SEPARATOR = ' || '

  def initialize(transaction_log = TransactionLog.new)
    @list = transaction_log.list
    @sep = DEFAULT_SEPARATOR
  end

  def format_time(date)
    date.strftime("%d/%m/%Y")
  end
end
