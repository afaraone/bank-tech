# frozen_string_literal: true

# Records transactions
class TransactionLog
  attr_reader :list

  def initialize
    @list = []
  end

  def record(amount, balance, type)
    log = { date: Time.now, balance: balance }
    log[type] = amount
    list.prepend(log)
  end
end
