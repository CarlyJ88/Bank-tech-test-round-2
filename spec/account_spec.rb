require 'account'
require 'Date'

describe Account do
  describe '#deposit' do
    it 'changes the balance when a deposit is made' do
      date = Date.new(2012, 01, 12)
      allow(Date).to receive(:today).and_return(date)
      expect(subject.deposit(1000.00)).to eq ({ date: date, deposit: 1000.00, balance: 1000.00 })
    end
  end
end