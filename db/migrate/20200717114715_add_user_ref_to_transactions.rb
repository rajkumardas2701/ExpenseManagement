class AddUserRefToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :user, foreign_key: true
  end
end
