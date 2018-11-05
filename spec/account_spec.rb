require 'account'

describe Account do
  let(:mock_transaction_log) { double(:mock_transaction_log) }
  subject { described_class.new(mock_transaction_log) }

  before do
    allow(mock_transaction_log).to receive(:record_deposit)
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
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'increases @balance by argument' do
      subject.deposit 1000
      expect(subject.balance).to eq 1000
    end

    it 'calls record_deposit with amount and balance as args' do
      expect(subject.transaction_log).to receive(:record_deposit).with(1000, 1000)
      subject.deposit(1000)
    end
  end

  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    context 'balance greater than withdraw amount' do
      before { subject.deposit 2000 }

      it 'deducts argument from @balance' do
        subject.withdraw(500)
        expect(subject.balance).to eq 1500
      end
    end

    context 'balance less than withdraw amount' do
      it 'raises error' do
        expect { subject.withdraw 1000 }.to raise_error 'Insufficient balance'
      end
    end
  end
end
