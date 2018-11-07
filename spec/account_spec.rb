# frozen_string_literal: true

require 'account'

describe Account do
  let(:mock_log) { double(:mock_log) }
  let(:mock_display) { double(:mock_display) }

  subject { described_class.new(transaction_log: mock_log, display: mock_display) }

  before do
    allow(mock_log).to receive(:record)
    allow(mock_log).to receive(:list)
    allow(mock_display).to receive(:statement)
  end

  describe '#deposit' do
    it 'increases @balance by argument' do
      subject.deposit 1000
      expect(subject.balance).to eq 1000
    end

    it 'calls record with amount, :credit and balance as args' do
      expect(subject.transaction_log).to receive(:record).with(1000, 1000, :credit)
      subject.deposit(1000)
    end
  end

  describe '#withdraw' do
    context 'balance greater than withdraw amount' do
      before { subject.deposit 2000 }

      it 'deducts argument from @balance' do
        subject.withdraw(500)
        expect(subject.balance).to eq 1500
      end

      it 'calls record with amount, :debit and balance as args' do
        expect(subject.transaction_log).to receive(:record).with(500, 1500, :debit)
        subject.withdraw(500)
      end
    end

    context 'balance less than withdraw amount' do
      it 'raises error' do
        expect { subject.withdraw 1000 }.to raise_error 'Insufficient balance'
      end
    end
  end

  describe '#statement' do
    it 'calls statement on display with list as argument' do
      expect(mock_display).to receive(:statement).with(mock_log.list)
      subject.statement
    end
  end
end
