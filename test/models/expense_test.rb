require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @expense = expenses(:one)
  end

  test "expense should be valid" do
    assert @expense.valid?
  end

  test "it should create a new expense" do
    category = categories(:one)
    expense = Expense.new(type_transaction: 'compra', date: Date.today, concept: 'Ferrari toy', category: category, amount: 17000.00)
    assert expense.save
  end

  test "it should validate concept must exist" do
    @expense.concept = nil
    @expense.validate
    assert_includes(@expense.errors[:concept], "can't be blank")
  end

  test "it should validate date must exist" do
    @expense.date = nil
    @expense.validate
    assert_includes(@expense.errors[:date], "can't be blank")
  end

end
