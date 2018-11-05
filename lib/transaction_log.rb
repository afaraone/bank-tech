class TransactionLog
  attr_accessor :list

  def initialize
    @list = []
  end

  def record(amount, balance, type)
    log = { date: Time.now, balance: balance }
    log[type] = amount
    list << log
  end
end
