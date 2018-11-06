# frozen_string_literal: true

require 'transaction_log'

describe TransactionLog do
  let(:date) { Time.parse('2018-09-09') }

  before do
    allow(Time).to receive(:now).and_return(date)
  end

  describe 'initialise' do
    it 'has @list set to an empty array' do
      expect(subject.list).to eq []
    end
  end

  describe 'record' do
    let(:withdrawal_log) { { date: '09/09/2018', debit: '400.00', balance: '1000.00' } }
    let(:deposit_log) { { date: '09/09/2018', credit: '400.00', balance: '1000.00' } }
    context 'when transaction is withdrawal' do
      it 'adds withdrawal log to list' do
        subject.record(400.00, 1000.00, :debit)
        expect(subject.list).to eq([withdrawal_log])
      end
    end

    context 'when transaction is deposit' do
      it 'adds deposit log to list' do
        subject.record(400.00, 1000.00, :credit)
        expect(subject.list).to eq([deposit_log])
      end
    end

    it 'prepends element to beginning of array' do
      subject.record(400.00, 1000.00, :debit)
      subject.record(400.00, 1000.00, :credit)
      expect(subject.list).to eq([deposit_log, withdrawal_log])
    end
  end
end
