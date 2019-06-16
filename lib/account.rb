require 'statement'

class Account

  def initialize
    @balance = 0
    @transaction = []
  end

  def statement
    statement = Statement.new
    statement.print_statement(@transaction)
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