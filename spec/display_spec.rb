# frozen_string_literal: true

require 'display'
describe Display do
  describe '#statement' do
    let(:row) { { date: '15/09/2018', credit: 200, balance: 1700 } }
    let(:row2) { { date: '12/09/2018', credit: 500, balance: 1500 } }
    let(:row3) { { date: '10/09/2018', debit: 200, balance: 1000 } }
    let(:list) { [row, row2, row3] }

    let(:statement) do
      ['date || credit || debit || balance',
       '15/09/2018 || 200 || || 1700',
       '12/09/2018 || 500 || || 1500',
       '10/09/2018 || || 200 || 1000'].join("\n") + "\n"
    end

    it 'prints header row and full list of transactions' do
      expect { subject.statement(list) }.to output(statement).to_stdout
    end
  end
end
