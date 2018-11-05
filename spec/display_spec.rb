require 'display'

describe Display do
  let(:mock_transaction_log) { double(:mock_transaction_log, list: []) }
  subject { described_class.new(mock_transaction_log)}

  describe 'initialize' do
    it 'has transaction_log list dependency injection' do
      expect(subject.list).to eq mock_transaction_log.list
    end
  end
end
