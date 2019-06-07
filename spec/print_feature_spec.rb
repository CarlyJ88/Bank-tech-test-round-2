require 'account'

describe 'print statement' do
  context 'no transactions have been made' do
    it 'shows a blank statement' do
      account = Account.new
      expect(account.statement).to eq 'date || credit || debit || balance'
    end
  end
end
