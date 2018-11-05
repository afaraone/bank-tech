class Account
  attr_reader :balance, :transaction_log

  def initialize(transaction_log = TransactionLog.new)
    @balance = 0
    @transaction_log = transaction_log
  end

  def deposit(amount)
    self.balance += amount
    transaction_log.record_deposit(amount, balance)
  end

  def withdraw(amount)
    raise 'Insufficient balance' if self.balance < amount

    self.balance -= amount
  end

  private

  attr_writer :balance
end
