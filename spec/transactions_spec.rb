require './lib/transactions.rb'

describe Transactions do

  subject(:transactions) { described_class.new }

  describe 'transaction_list' do
    it 'should create an empty array to store transactions in' do
      expect(transactions.transaction_list).to eq([])
    end
  end
end
