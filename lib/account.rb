class Account

  def initialize
    @balance = 0
    @transaction = []
  end

  def statement
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

  def deposit(value)
    deposit = { date: Date.today, deposit: value, balance: @balance += value }
    @transaction.unshift(deposit)
    deposit
  end

  def withdraw(value)
    withdraw = { date: Date.today, withdraw: value, balance: @balance -= value }
    @transaction.unshift(withdraw)
    withdraw
  end
end