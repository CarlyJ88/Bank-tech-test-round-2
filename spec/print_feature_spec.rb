require 'account'

describe 'print statement' do
  context 'no transactions have been made' do
    it 'shows a blank statement' do
      account = Account.new
      expect(account.statement).to eq "date || credit || debit || balance\n"
    end
    it 'shows a deposit has been made' do
      date = Date.new(2012, 01, 12)
      allow(Date).to receive(:today).and_return(date)

      account = Account.new
      account.deposit(1000.00)
      expect(account.statement).to eq ("date || credit || debit || balance\n" +
                                       "12/01/2012 || 1000.00 || || 1000.00\n")
    end
    it 'shows another deposit has been made' do
      date2 = Date.new(2012, 01, 12)
      allow(Date).to receive(:today).and_return(date2)
      account = Account.new
      account.deposit(1000)
      date = Date.new(2012, 01, 13)
      allow(Date).to receive(:today).and_return(date)
      account.deposit(2000)
      expect(account.statement).to eq ("date || credit || debit || balance\n" +
                                       "13/01/2012 || 2000.00 || || 3000.00\n" +
                                       "12/01/2012 || 1000.00 || || 1000.00\n")
    end
    it 'shows a withdrawal has been made' do
      date2 = Date.new(2012, 01, 12)
      allow(Date).to receive(:today).and_return(date2)
      account = Account.new
      account.deposit(1000)

      date = Date.new(2012, 01, 13)
      allow(Date).to receive(:today).and_return(date)
      account.deposit(2000)

      date3 = Date.new(2012, 01, 14)
      allow(Date).to receive(:today).and_return(date3)
      account.withdraw(500)
      expect(account.statement).to eq ("date || credit || debit || balance\n" +
                                       "14/01/2012 || || 500.00 || 2500.00\n" +
                                       "13/01/2012 || 2000.00 || || 3000.00\n" +
                                       "12/01/2012 || 1000.00 || || 1000.00\n")
    end
  end
end
