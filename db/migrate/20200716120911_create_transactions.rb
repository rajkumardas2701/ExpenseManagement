class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.float :amount
      t.date :createdAt

      t.timestamps
    end
  end
end
