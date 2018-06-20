require './lib/account.rb'

describe Account do
  subject(:account) { described_class.new }

  it 'The balance is zero' do
    expect(account.balance).to eq(0)
  end

  it 'Responds to deposit method' do
    expect(account).to respond_to(:deposit).with(2).argument
  end
end
