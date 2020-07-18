class AddGroupRefToGroupExpenses < ActiveRecord::Migration[6.0]
  def change
    add_reference :group_expenses, :Group, null: false, foreign_key: true
  end
end
