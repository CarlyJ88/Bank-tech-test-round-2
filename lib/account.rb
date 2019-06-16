require 'statement'

class Account

  def initialize
    @balance = 0
    @transaction = []
  end

  def statement
    statement = Statement.new(@transaction)
    statement.print_statement
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