# frozen_string_literal: true

require 'account'
require 'transaction_log'
require 'display'

describe 'Feature Test based on Specification' do
  let(:date) { Time.parse('2012-01-10') }
  let(:date2) { Time.parse('2012-01-13') }
  let(:date3) { Time.parse('2012-01-14') }

  let(:statement) do
    ['date || credit || debit || balance',
     '14/01/2012 || || 500.00 || 2500.00',
     '13/01/2012 || 2000.00 || || 3000.00',
     '10/01/2012 || 1000.00 || || 1000.00'].join("\n") + "\n"
  end

  subject { Account.new }

  before do
    allow(Time).to receive(:now).and_return(date)
    subject.deposit(1000.00)
    allow(Time).to receive(:now).and_return(date2)
    subject.deposit(2000.00)
    allow(Time).to receive(:now).and_return(date3)
    subject.withdraw(500.00)
  end

  it 'prints a full statment of users transactions' do
    expect { subject.statement }.to output(statement).to_stdout
  end
end
