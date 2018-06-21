require './lib/account.rb'

describe 'Account' do
  subject(:account) { Account.new(Transactions.new, Statement.new) }
  let(:date) { double(:date) }

  it ' A user creates a new account and the balance is zero' do
    expect(account.balance).to eq(0)
  end

  it 'A user can enter a deposit' do
    account.deposit(:date, 500)
    expect(account.transactions.transaction_list).to include([:date, 500, 500])
  end

  it 'A user can withdraw some money' do
    account.deposit(:date, 500)
    account.withdraw(:date, 300)
    expect(account.transactions.transaction_list).to include([:date, 300, 200])
  end

  context 'A statement is printed' do
    let(:print) {
      "Date     || Credit || Debit || Balance\n" \
      "date || 1000 ||   || 1000\n" \
      "date || 2000 ||   || 3000\n" \
      "date ||   || 500 || 2500\n"
    }

    it 'A user deposits twice, withdraws three times and then prints their statement' do
      account.deposit(:date, 1000)
      account.deposit(:date, 2000)
      account.withdraw(:date, 500)
      expect{ account.show_statement }.to output(print).to_stdout
    end
  end

end
