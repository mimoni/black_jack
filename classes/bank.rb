# frozen_string_literal: true

class Bank
  def initialize(balance = 100)
    @balance = balance
  end

  def withdraw(amount = 10)
    @balance -= amount
  end

  def deposit(amount)
    @balance += amount
  end

  def zero?
    @balance.zero?
  end

  def to_s
    @balance.to_s
  end
end
