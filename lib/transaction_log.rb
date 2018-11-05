class TransactionLog
  attr_accessor :list

  def initialize
    @list = []
  end

  def record_deposit(amount, balance)
    log = { date: Time.now, credit: amount, debit: nil, balance: balance }
    list << log
  end

  def record_withdrawal(amount, balance)
    log = { date: Time.now, credit: nil, debit: amount, balance: balance }
    list << log
  end
end
