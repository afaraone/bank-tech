require 'transaction'

describe Transaction do
  describe 'initialise' do
    it 'has @list set to an empty array' do
      expect(subject.list).to eq []
    end
  end

  describe 'record_deposit' do
    it { is_expected.to respond_to(:record_deposit).with(2).arguments }

    it 'returns a hash with amount, balance, type of transaction, date' do
      date = Timecop.freeze(Time.new(2018, 9, 9))
      log = { date: date, credit: 400, debit: nil, balance: 1000 }
      expect(subject.record_deposit(400, 1000)).to eq log
    end
  end
end
