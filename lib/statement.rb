class Statement

  def print_statement(transaction)
    header = "date || credit || debit || balance\n"
    body = transaction.map do |print_item| 
      "#{print_item[:date].strftime("%d/%m/%Y")} ||" +
      " #{format_amount(print_item[:deposit])}||" +
      " #{format_amount(print_item[:withdraw])}||" +
      " #{'%.2f' % print_item[:balance]}\n" 
    end
    .join
    header + body
  end

  def format_amount(number)
    number == nil ? "" : '%.2f ' % number
  end
end