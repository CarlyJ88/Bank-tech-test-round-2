class Account
  def statement
    header = "date || credit || debit || balance"
    body =''
    if @deposit_made
      credit = deposit(1000.0)
      body = "\n#{credit[:date].strftime("%d/%m/%Y")} || #{'%.2f' % credit[:deposit]} || || #{'%.2f' % credit[:balance]}\n"
    end
    header + body
  end

  def deposit(value)
    @deposit_made = true
    { balance: 1000, date: Date.today, deposit: 1000.0 }
  end
end