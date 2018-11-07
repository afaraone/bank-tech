# frozen_string_literal: true

require 'display'
describe Display do
  describe '#statement' do
    let(:date) { Time.parse('2018-09-15') }
    let(:date2) { Time.parse('2018-09-12') }
    let(:date3) { Time.parse('2018-09-10') }

    let(:row) { { date: date, credit: 200.00, balance: 1700.00 } }
    let(:row2) { { date: date2, credit: 500.00, balance: 1500.00 } }
    let(:row3) { { date: date3, debit: 200.00, balance: 1000.00 } }
    let(:list) { [row, row2, row3] }

    let(:statement) do
      ['date || credit || debit || balance',
       '15/09/2018 || 200.00 || || 1700.00',
       '12/09/2018 || 500.00 || || 1500.00',
       '10/09/2018 || || 200.00 || 1000.00'].join("\n") + "\n"
    end

    it 'prints header row and full list of transactions' do
      expect { subject.statement(list) }.to output(statement).to_stdout
    end
  end
end
