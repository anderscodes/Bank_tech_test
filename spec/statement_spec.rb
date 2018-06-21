require './lib/statement'

describe Statement do

  subject(:statement) { described_class.new }

  let(:transaction_list) do
    [
      ["14-07-18", 600, " ", 600],
      ["15-08-18", " ", 200, 400],
      ["26-09-18", " ", 200, 200]
    ]
  end

  describe '#pretty_print' do
    let(:pretty_print) {
      "Date     || Credit || Debit || Balance\n" \
      "14-07-18 || 600 ||   || 600\n" \
      "15-08-18 ||   || 200 || 400\n" \
      "26-09-18 ||   || 200 || 200\n"
    }

    it 'should pretty_print the transactions_list' do
      expect { statement.pretty_print(transaction_list) }.to output(pretty_print).to_stdout
    end
  end

end
