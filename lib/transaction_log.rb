# frozen_string_literal: true

# Records transactions
class TransactionLog
  attr_reader :list

  def initialize
    @list = []
  end

  def record(amount, balance, type)
    log = { date: format_time(Time.now), balance: balance }
    log[type] = amount
    list << log
  end

  private

  def format_time(date)
    date.strftime('%d/%m/%Y')
  end
end
