require 'display'

describe Display do
  let(:mock_transaction_log) { double(:mock_transaction_log, list: []) }
  subject { described_class.new(mock_transaction_log)}

  describe 'initialize' do
    it 'has transaction_log list dependency injection' do
      expect(subject.list).to eq mock_transaction_log.list
    end
  end

  describe 'format_row' do
    it 'converts a record hash to formatted string with separator' do
    end
  end

  describe 'Time format' do
    let(:date) { Time.parse('2018-09-10') }

    before do
      allow(Time).to receive(:now).and_return(date)
    end

    it 'returns time in user-friendly format' do
      expect(subject.format_time(date)).to eq '10/09/2018'
    end
  end
end
