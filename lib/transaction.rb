class Transaction
  attr_accessor :list

  def initialize
    @list = []
  end

  def record_deposit(amount, balance)
    { date: Time.now, credit: amount, debit: nil, balance: balance }
  end
end
