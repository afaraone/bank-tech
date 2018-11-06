# frozen_string_literal: true

# Records transactions
class TransactionLog
  attr_reader :list

  def initialize
    @list = []
  end

  def record(amount, balance, type)
    log = { date: format_time(Time.now), balance: format_number(balance) }
    log[type] = format_number(amount)
    list.prepend(log)
  end

  private

  def format_number(number)
    "%.2f" %  number
  end

  def format_time(date)
    date.strftime('%d/%m/%Y')
  end
end
