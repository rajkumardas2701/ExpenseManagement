class AddUserRefToExpense < ActiveRecord::Migration[6.0]
  def change
    add_reference :expenses, :User, null: false, foreign_key: true
  end
end
