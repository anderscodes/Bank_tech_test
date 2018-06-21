class Transactions

  attr_reader :transaction_list

  def initialize
    @transaction_list = []
  end

  def deposit(date, amount)
    transaction_list.push([date, amount])
  end

  def withdraw(date, amount)
    transaction_list.push([date, amount])
  end

end
