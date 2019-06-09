class Account

  def initialize
    @balance = 0
    @transaction = []
  end

  def statement
     header = "date || credit || debit || balance\n"
     body = ''
    if !@transaction.empty?
      @transaction.each { |print_item| body += "#{print_item[:date].strftime("%d/%m/%Y")} || #{'%.2f' % print_item[:deposit]} || || #{'%.2f' % print_item[:balance]}\n" } 
    end
    header + body
      
  end

  def deposit(value)
    @deposit = { date: Date.today, deposit: value, balance: @balance += value }
    @transaction.unshift(@deposit)
    @deposit
  end

  def transaction
    @transaction
  end
end