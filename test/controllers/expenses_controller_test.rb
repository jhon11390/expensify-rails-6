require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @expense = expenses(:one)
  end

  test "a user can update an existing expense" do
    category = categories(:one)
    patch expense_path(@expense), params: { expense: { type_transaction: 'Purchase', date: Date.today, concept: 'Ferrari toy', category: category, amount: 17000.00 } }
    assert_redirected_to expenses_path
    assert_equal "The expense was updated successfully!", flash[:notice]
  end

  test "a user can delete an existing expense" do
    delete expense_path(@expense)
    assert_redirected_to expenses_path
    assert_equal "The #{@expense.type_transaction} #{@expense.concept} for $#{@expense.amount} on #{@expense.date.strftime("%b")} #{@expense.date.strftime("%d")} was destroyed successfully!", flash[:notice]
  end
end
