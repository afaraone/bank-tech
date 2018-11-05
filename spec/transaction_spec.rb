require 'transaction'

describe Transaction do
  describe 'initialise' do
    it 'has @list set to an empty array' do
      expect(subject.list).to eq []
    end
  end
end
