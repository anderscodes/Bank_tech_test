require './lib/account.rb'

describe Account do
  subject(:account) { described_class.new }

  it ' A user creates a new account and the balance is zero' do
    expect(account.balance).to eq(0)
  end

end
