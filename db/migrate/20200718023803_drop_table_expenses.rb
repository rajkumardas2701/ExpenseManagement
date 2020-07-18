class DropTableExpenses < ActiveRecord::Migration[6.0]
  def change
  	drop_table :expenses
  end
end
