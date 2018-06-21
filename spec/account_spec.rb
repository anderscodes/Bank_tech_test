require './lib/account.rb'

describe Account do
  subject(:account) { described_class.new(transactions, statement) }
  let(:transactions) { double(:transactions) }
  let(:statement) { double(:statement) }
  let(:date) { double(:date) }


  describe '#balance' do
    it 'The balance is zero' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do

    it 'should raise an error if anything other than a number is input' do
      expect{ account.deposit(:date, "23") }.to raise_error('Input must be an integer or a float')
    end

    context 'A deposit is made' do
      before do
        allow(transactions).to receive(:deposit)
        account.deposit(:date, 500)
      end

      it 'should call deposit on transactions' do
        expect(transactions).to have_received(:deposit).with(:date, 500, 500)
      end

      it 'should update the balance when a deposit is made' do
        expect(account.balance).to eq(500)
      end
    end
  end

  describe '#transactions' do
    it 'should equal transactions' do
      expect(account.transactions).to eq(transactions)
    end
  end

  describe '#statement' do
    it 'should equal statement' do
      expect(account.statement).to eq(statement)
    end
  end

  describe '#withdraw' do
    context 'A deposit is made and withdrawal is made' do
      before do
        allow(transactions).to receive(:deposit)
        allow(transactions).to receive(:withdraw)
        account.deposit(:date, 500)
        account.withdraw(:date, 300)
      end


      it 'should call withdraw on transactions' do
        expect(transactions).to have_received(:withdraw).with(:date, 300, 200)
      end

      it 'should update the balance when a withdrawal is made' do
        expect(account.balance).to eq(200)
      end

      it 'An error is raised if user tries to withdraw more money than is in account' do
        expect{ account.withdraw(:date, 250) }.to raise_error('Insufficent funds available')
      end

      it 'should raise an error if anything other than a number is input' do
        expect{ account.withdraw(:date, "23") }.to raise_error('Input must be an integer or a float')
      end
    end
  end

  describe '#show_statement' do
    it 'calls pretty_print on the statement object' do
      allow(statement).to receive(:pretty_print)
      account.show_statement
      expect(statement).to have_received(:pretty_print)
    end
  end
end
