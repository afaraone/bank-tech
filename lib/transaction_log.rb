# frozen_string_literal: true

class TransactionLog
  attr_accessor :list

  def initialize
    @list = []
  end

  def record(amount, balance, type)
    log = { date: format_time(Time.now), balance: balance }
    log[type] = amount
    list << log
  end

  def format_time(date)
    date.strftime('%d/%m/%Y')
  end
end
