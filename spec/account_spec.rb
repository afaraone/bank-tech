require 'account'

describe Account do
  describe 'initialization' do
    it { is_expected.to respond_to :balance }

    it 'has balance variable set to 0' do
      expect(subject.balance).to eq 0
    end
  end
end
