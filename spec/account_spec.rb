require './lib/account.rb'

describe Account do
  subject(:account) { described_class.new(transactions) }
  let(:transactions) { double(:transactions) }
  let(:date) { double(:date) }

  describe '#balance' do
    it 'The balance is zero' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'Responds to deposit method' do
      expect(account).to respond_to(:deposit).with(2).argument
    end

    context 'A deposit is made' do
      before do
        allow(transactions).to receive(:deposit)
        account.deposit(:date, 500)
      end

      it 'should call deposit on transactions' do
        expect(transactions).to have_received(:deposit).with(:date, 500)
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

  describe '#withdraw' do
    it 'Responds to the withdraw method' do
      expect(account).to respond_to(:withdraw).with(2).argument
    end

    it 'should call withdraw on transactions' do
      allow(transactions).to receive(:withdraw)
      account.withdraw(:date, 300)
      expect(transactions).to have_received(:withdraw).with(:date, 300)
    end
  end

end
