class Account

  attr_reader :balance, :transactions

  def initialize(transactions)
    @balance = 0
    @transactions = transactions
  end

  def deposit(date, amount)
    numeric_check(amount)
    credit(amount)
    transactions.deposit(date, amount, balance)
  end

  def withdraw(date, amount)
    numeric_check(amount)
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

  def numeric_check(amount)
    if amount.to_f != amount
      raise 'Input must be an integer or a float'
    end
  end


end
