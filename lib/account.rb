# frozen_string_literal: true

# Stores and manipulates balance
class Account
  attr_reader :balance, :transaction_log
  START_BALANCE = 0

  def initialize(transaction_log = TransactionLog.new)
    @balance = START_BALANCE
    @transaction_log = transaction_log
  end

  def deposit(amount)
    self.balance += amount
    transaction_log.record(amount, balance, :credit)
  end

  def withdraw(amount)
    raise 'Insufficient balance' if self.balance < amount

    self.balance -= amount
    transaction_log.record(amount, balance, :debit)
  end

  private

  attr_writer :balance
end
