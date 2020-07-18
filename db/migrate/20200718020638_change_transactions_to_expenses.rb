class ChangeTransactionsToExpenses < ActiveRecord::Migration[6.0]
  def change
  	rename_table :transactions, :expenses
  end
end
