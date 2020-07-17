class AddAuthorIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :AuthorId, :integer
  end
end
