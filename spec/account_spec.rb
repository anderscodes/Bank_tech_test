require './lib/account.rb'

describe Account do
  subject(:account) { described_class.new(transactions) }
  let(:transactions) { double(:transactions) }

  describe '#balance' do
    it 'The balance is zero' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'Responds to deposit method' do
      expect(account).to respond_to(:deposit).with(2).argument
    end
  end

  describe '#transactions' do
    it 'should equal transactions' do
      expect(transactions).to eq(transactions)
    end
  end

end
