require 'account'

describe 'print statement' do
  context 'no transactions have been made' do
    it 'shows a blank statement' do
      account = Account.new
      expect(account.statement).to eq 'date || credit || debit || balance'
    end
  end
  context 'shows transactions made' do
    it 'shows a deposit has been made' do
      date = Date.new(2012, 01, 12)
      allow(Date).to receive(:today).and_return(date)

      account = Account.new
      account.deposit(1000.00)
      expect(account.statement).to eq ("date || credit || debit || balance\n" +
                                       "12/01/2012 || 1000.00 || || 1000.00\n")
    end
  end
end
