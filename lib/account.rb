class Account

  attr_reader :balance, :transactions

  def initialize(transactions)
    @balance = 0
    @transactions = transactions
  end

  def deposit(date, amount)
    credit(amount)
    transactions.deposit(date, amount, balance)
  end

  def withdraw(date, amount)
    account_check(amount)
    debit(amount)
    transactions.withdraw(date, amount, balance)
  end

  private

  def credit(amount)
    @balance += (amount)
  end

  def debit(amount)
    @balance -= (amount)
  end

  def account_check(amount)
    if balance - amount <= 0
      raise 'Insufficent funds available'
    end
  end

end
