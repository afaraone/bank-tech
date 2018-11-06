# frozen_string_literal: true

require 'display'
describe Display do
  let(:mock_transaction_log) { double(:mock_transaction_log, list: []) }

  subject { described_class.new(mock_transaction_log) }

  describe 'initialize' do
    it 'has transaction_log list dependency injection' do
      expect(subject.list).to eq mock_transaction_log.list
    end
  end

  describe 'header' do
    it 'returns a formatted list of column names' do
      expect(subject.header).to eq 'date || credit || debit || balance'
    end
  end

  describe 'format_row' do
    let(:row) { { date: '10/09/2018', credit: 200, balance: 1000 } }

    it 'converts a record hash to formatted string with separator' do
      output = '10/09/2018 || 200 ||  || 1000'
      expect(subject.format_row(row)).to eq output
    end
  end
end
