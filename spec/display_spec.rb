require 'display'
# maybe dont use time now here? should just set a time date myself
describe Display do
  let(:date) { Time.parse('2018-09-10') }
  let(:mock_transaction_log) { double(:mock_transaction_log, list: []) }

  subject { described_class.new(mock_transaction_log)}

  before do
    allow(Time).to receive(:now).and_return(date)
  end

  describe 'initialize' do
    it 'has transaction_log list dependency injection' do
      expect(subject.list).to eq mock_transaction_log.list
    end
  end

  describe 'format_row' do
    let(:row) { {date: Time.now, credit: 200, balance: 1000 } }

    it 'converts a record hash to formatted string with separator' do
      output = "10/09/2018 || 200 ||  || 1000\n"
      expect(subject.format_row(row)).to eq output
    end
  end

  describe 'Time format' do
    it 'returns time in user-friendly format' do
      expect(subject.format_time(date)).to eq '10/09/2018'
    end
  end
end
