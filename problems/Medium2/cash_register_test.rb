require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'
require 'stringio'


require 'pry'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(100)
    transaction = Transaction.new(20)

    transaction.amount_paid = 20
    previous_amount = register.total_money

    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal(previous_amount + 20, current_amount)
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)

    transaction.amount_paid = 100
    change = register.change(transaction)

    assert_equal(80, change)
  end

  def test_give_receipt
    item_cost= 20
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)

    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end

  def test_prompt_for_payment
    transaction = Transaction.new(20)

    input = StringIO.new('40\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)

    assert_equal(40 , transaction.amount_paid)
  end
end
