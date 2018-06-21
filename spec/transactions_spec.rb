require './lib/transactions.rb'

describe Transactions do

  subject(:transactions) { described_class.new }

  describe 'transaction_list' do
    it 'should create an empty array to store transactions in' do
      expect(transactions.transaction_list).to eq([])
    end
  end

  describe 'deposit' do
    it 'should save a deposit with a date and an amount' do
      transactions.deposit("12-03-15", 500, 500)
      expect(transactions.transaction_list).to include(["12-03-15", 500, 500])
    end
  end

  describe 'withdraw' do
    it 'should save a withdrawal with a date and an amount' do
      transactions.withdraw("12-03-16", 400, 300)
      expect(transactions.transaction_list).to include(["12-03-16", 400, 300])
    end
  end
end
