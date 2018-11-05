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
    it { is_expected.to respond_to(:deposit).with(1).argument}

    it 'increases @balance by argument' do
      subject.deposit 1000
      expect(subject.balance).to eq 1000
    end
  end
end
