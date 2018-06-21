require './lib/account.rb'

describe 'Account' do
  subject(:account) { Account.new(Transactions.new) }
  let(:date) { double(:date) }

  it ' A user creates a new account and the balance is zero' do
    expect(account.balance).to eq(0)
  end

  it 'A user can enter a deposit' do
    account.deposit(:date, 500)
    expect(account.transactions.transaction_list).to include([:date, 500, 500])
  end

  it 'A user can withdraw some money' do
    account.withdraw(:date, 300)
    expect(account.transactions.transaction_list).to include([:date, 300, -300])
  end



end
