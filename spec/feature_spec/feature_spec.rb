require './lib/account.rb'

describe 'Account' do
  subject(:account) { Account.new(Transactions.new, Statement.new) }

  it ' A user creates a new account and the balance is zero' do
    expect(account.balance).to eq(0)
  end

  it 'A user can enter a deposit' do
    account.deposit("2018-06-21", 500)
    expect(account.transactions.transaction_list).to include(["2018-06-21", 500, "", 500])
  end

  it 'A user can withdraw some money' do
    account.deposit("2018-06-21", 500)
    account.withdraw("2018-06-21", 300)
    expect(account.transactions.transaction_list).to include(["2018-06-21", "", 300, 200])
  end

  context 'A statement is printed' do
    let(:print) {
      "Date     || Credit || Debit || Balance\n" \
      "2018-06-21 || 1000 ||  || 1000\n" \
      "2018-06-21 || 2000 ||  || 3000\n" \
      "2018-06-21 ||  || 500 || 2500\n"
    }

    it 'A user deposits twice, withdraws three times and then prints their statement' do
      account.deposit("2018-06-21", 1000)
      account.deposit("2018-06-21", 2000)
      account.withdraw("2018-06-21", 500)
      expect { account.show_statement }.to output(print).to_stdout
    end
  end

end
