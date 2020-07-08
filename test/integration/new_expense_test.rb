require "application_system_test_case"

class ExpensesContentTest < ApplicationSystemTestCase
  
  test "a user can create an expense" do
    visit expenses_path
    click_link "New Expense"
    fill_in "concept", with: "Restaurante"
    fill_in "amount", with: 170000
    click_button "Create Expense"
    
    assert_current_path expenses_path
    assert page.has_content?('Restaurante')
    assert_equal(Expense.last.concept, "Restaurante")
  end
end
