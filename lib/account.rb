class Account

  attr_reader :balance, :transactions

  def initialize(transactions)
    @balance = 0
    @transactions = transactions
  end

  def deposit(date, amount)
    credit(amount)
    transactions.deposit(date, amount)
  end

  def withdraw(date, amount)
    debit(amount)
    transactions.withdraw(date, amount)
  end

  private

  def credit(amount)
    @balance += (amount)
  end

  def debit(amount)
    @balance -= (amount)
  end

end
