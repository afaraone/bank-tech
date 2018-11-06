# frozen_string_literal: true

class Display
  attr_reader :list, :sep
  COLUMNS = %i[date credit debit balance].freeze
  DEFAULT_SEPARATOR = ' || '

  def initialize(transaction_log = TransactionLog.new)
    @list = transaction_log.list
    @sep = DEFAULT_SEPARATOR
  end

  def statement
    puts header
    self.list.each { |row| puts format_row(row) }
  end

  def header
    COLUMNS.join(sep)
  end

  def format_row(row)
    output = []
    COLUMNS.each { |col| output << row[col] }
    output.join(sep)
  end
end
