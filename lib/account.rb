class Account
  attr_reader :balance, :transaction

  def initialize(transaction = Transaction.new)
    @balance = 0
    @transaction = transaction
  end
end
