# frozen_string_literal: true

require_relative 'display'
require_relative 'transaction_log'

# Stores and manipulates balance
class Account
  attr_reader :balance

  START_BALANCE = 0.00

  def initialize(transaction_log: TransactionLog.new, display: Display.new)
    @balance = START_BALANCE
    @transaction_log = transaction_log
    @display = display
  end

  def deposit(amount)
    @balance += amount
    @transaction_log.record(amount, balance, :credit)
  end

  def withdraw(amount)
    raise 'Insufficient balance' if insufficient?(amount)

    @balance -= amount
    @transaction_log.record(amount, balance, :debit)
  end

  def statement
    @display.statement(@transaction_log.list)
  end

  private

  def insufficient?(amount)
    @balance < amount
  end
end
