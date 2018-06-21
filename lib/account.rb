require 'date'

class Account

  attr_reader :balance, :transactions, :statement

  def initialize(transactions, statement)
    @balance = 0
    @transactions = transactions
    @statement = statement
  end

  def deposit(date = Date.today.strftime, amount)
    date?(date)
    number?(amount)
    credit(amount)
    transactions.deposit(date, amount, balance)
  end

  def withdraw(date = Date.strftime("%m/%d/%Y"), amount)
    number?(amount)
    funds_check(amount)
    debit(amount)
    transactions.withdraw(date, amount, balance)
  end

  def show_statement
    empty?
    statement.pretty_print(transactions.transaction_list)
  end



  private

  def credit(amount)
    @balance += amount
  end

  def debit(amount)
    @balance -= amount
  end

  def funds_check(amount)
    raise 'Insufficent funds available' if balance - amount <= 0
  end

  def number?(amount)
    raise 'Input must be an integer or a float' if amount.to_f != amount
  end

  def empty?
    raise 'Nothing to show here!' if transactions.transaction_list == []
  end

  def date?(date)
    Date.parse(date)
  end


end
