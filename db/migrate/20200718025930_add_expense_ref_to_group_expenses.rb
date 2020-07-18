class AddExpenseRefToGroupExpenses < ActiveRecord::Migration[6.0]
  def change
    add_reference :group_expenses, :Expense, null: false, foreign_key: true
  end
end
