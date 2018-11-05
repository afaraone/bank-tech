require 'account'

describe Account do
  let(:mock_transaction) { double(:mock_transaction) }
  subject { described_class.new(mock_transaction) }

  describe 'initialization' do
    it 'has balance variable set to 0' do
      expect(subject.balance).to eq 0
    end

    it 'has an injected transaction obj' do
      expect(subject.transaction).to eq mock_transaction
    end
  end

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'increases @balance by argument' do
      subject.deposit 1000
      expect(subject.balance).to eq 1000
    end
  end

  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    context 'balance greater than withdraw amount' do
      before { subject.deposit(20000)}

      it 'deducts argument from @balance' do
        subject.withdraw(5000)
        expect(subject.balance).to eq (15000)
      end
    end

    context 'balance less than withdraw amount' do
      it 'raises error' do
        expect { subject.withdraw 1000 }.to raise_error 'Insufficient balance'
      end
    end
  end
end
