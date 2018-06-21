class Statement

  def pretty_print(transactions_list)
    puts header
    transactions_list.each do |date, price, type, balance|
      puts "#{date} || #{price} || #{type} || #{balance}"
    end
  end

  private

  def header
    "Date     || Credit || Debit || Balance"
  end

end
