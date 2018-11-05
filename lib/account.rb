class Account
  attr_reader :balance, :transaction

  def initialize(transaction = Transaction.new)
    @balance = 0
    @transaction = transaction
  end

  def deposit(amount)
    self.balance += amount
  end

  private
  attr_writer :balance
end
