require 'account'
require 'Date'

describe Account do
  describe '#deposit' do
    it 'tracks a transaction' do
      date = Date.new(2012, 01, 12)
      allow(Date).to receive(:today).and_return(date)
      expect(subject.deposit(1000)).to eq ({ date: date, deposit: 1000, balance: 1000 })
    end
    it 'tracks another transaction' do
      date = Date.new(2012, 01, 13)
      allow(Date).to receive(:today).and_return(date)
      subject.deposit(1000)
      expect(subject.deposit(2000)).to eq ({ date: date, deposit: 2000, balance: 3000 })
    end
  end
  describe '#transaction' do
    it 'tracks transactions' do
      date1 = Date.new(2012, 01, 12)
      date2 = Date.new(2012, 01, 13)
      allow(Date).to receive(:today).and_return(date1)
      subject.deposit(1000)
      allow(Date).to receive(:today).and_return(date2)
      subject.deposit(2000)
      expect(subject.transaction).to eq ([{ date: date2, deposit: 2000, balance: 3000}, { date: date1, deposit: 1000, balance: 1000 }])
    end
  end
end