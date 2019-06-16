class Statement

  def initialize(transaction)
    @transaction = transaction
  end
  
  def print_statement
    header = "date || credit || debit || balance\n"
    body = @transaction.map do |print_item| 
      "#{print_item[:date].strftime("%d/%m/%Y")} ||" +
      " #{ print_item[:deposit] == nil ? "" : '%.2f ' % print_item[:deposit] }||" +
      " #{ print_item[:withdraw] == nil ? "" : '%.2f ' % print_item[:withdraw] }||" +
      " #{'%.2f' % print_item[:balance]}\n" 
    end
    .join
    header + body
  end
end