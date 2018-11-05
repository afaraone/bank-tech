require 'account'

describe Account do
  let(:mock_transaction_log) { double(:mock_transaction_log) }
  subject { described_class.new(mock_transaction_log) }

  before do
    allow(mock_transaction_log).to receive(:record)
  end

  describe 'initialization' do
    it 'has balance variable set to 0' do
      expect(subject.balance).to eq 0
    end

    it 'has an injected transaction_log obj' do
      expect(subject.transaction_log).to eq mock_transaction_log
    end
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
end
