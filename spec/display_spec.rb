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

  describe '#statement' do
    let(:row) { { date: '15/09/2018', credit: 200, balance: 1700 } }
    let(:row2) { { date: '12/09/2018', credit: 500, balance: 1500 } }
    let(:row3) { { date: '10/09/2018', debit: 200, balance: 1000 } }
    let(:list) { [row, row2, row3] }
    let(:statement)   {["date || credit || debit || balance",
                        "15/09/2018 || 200 ||  || 1700",
                        "12/09/2018 || 500 ||  || 1500",
                        "10/09/2018 ||  || 200 || 1000"].join("\n") + "\n"}

    it 'prints header row and full list of transactions' do
      allow(mock_transaction_log).to receive(:list).and_return(list)
      expect { subject.statement }.to output(statement).to_stdout
    end
  end

  describe '#header' do
    it 'returns a formatted list of column names' do
      expect(subject.header).to eq 'date || credit || debit || balance'
    end
  end

  describe '#format_row' do
    let(:row) { { date: '10/09/2018', credit: 200, balance: 1000 } }

    it 'converts a record hash to formatted string with separator' do
      output = '10/09/2018 || 200 ||  || 1000'
      expect(subject.format_row(row)).to eq output
    end
  end
end
