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

  #does this change translog list?
  def format_row(row)
    output = []
    [:date, :credit, :debit, :balance].each do |col|
      row[col] = format_time(row[col]) if col == :date 
      output << row[col]
    end
    output.join(sep) + "\n"
  end
end
