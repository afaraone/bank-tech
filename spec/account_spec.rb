require 'account'

describe Account do
  describe 'initialization' do
    it 'has balance variable set to 0' do
      expect(subject.balance).to eq 0.00
    end
  end
end
