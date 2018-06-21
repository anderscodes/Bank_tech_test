class Transactions

  attr_reader :transaction_list

  def initialize
    @transaction_list = []
  end

  def deposit(date, amount, balance)
    transaction_list.push([date, amount, balance])
  end

  def withdraw(date, amount, balance)
    transaction_list.push([date, amount, balance])
  end

end
