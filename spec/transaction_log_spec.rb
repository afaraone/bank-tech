require 'transaction_log'

describe TransactionLog do
  let(:date) { Time.parse('2018-09-09') }
  let(:deposit_log) { { date: date, credit: 400, debit: nil, balance: 1000 } }
  let(:withdrawal_log) { { date: date, credit: nil, debit: 400, balance: 1000 } }

  before do
    allow(Time).to receive(:now).and_return(date)
  end

  describe 'initialise' do
    it 'has @list set to an empty array' do
      expect(subject.list).to eq []
    end
  end

  describe 'record_deposit' do
    it { is_expected.to respond_to(:record_deposit).with(2).arguments }

    it 'adds transaction to list' do
      subject.record_deposit(400, 1000)
      expect(subject.list).to eq([deposit_log])
    end
  end

  describe 'record_deposit' do
    it { is_expected.to respond_to(:record_withdrawal).with(2).arguments }

    it 'adds transaction to list' do
      subject.record_withdrawal(400, 1000)
      expect(subject.list).to eq([withdrawal_log])
    end
  end
end
