require 'account'
require 'Date'

describe Account do
  describe '#deposit' do
    it 'tracks a deposit' do
      date = Date.new(2012, 01, 12)
      allow(Date).to receive(:today).and_return(date)
      expect(subject.deposit(1000)).to eq ({ date: date, deposit: 1000, balance: 1000 })
    end
    it 'tracks another deposit' do
      date = Date.new(2012, 01, 13)
      allow(Date).to receive(:today).and_return(date)
      subject.deposit(1000)
      expect(subject.deposit(2000)).to eq ({ date: date, deposit: 2000, balance: 3000 })
    end
  end
  
  describe '#withdraw' do
    it 'tracks a withdrawal' do
      # date1 = Date.new(2012, 01, 12)
      # date2 = Date.new(2012, 01, 13)
      date3 = Date.new(2012, 01, 14)
      # allow(Date).to receive(:today).and_return(date1)
      subject.deposit(1000)

      # allow(Date).to receive(:today).and_return(date2)
      subject.deposit(2000)

      allow(Date).to receive(:today).and_return(date3)
      expect(subject.withdraw(500)).to eq ({ date: date3, withdraw: 500, balance: 2500})
    end
  end
end