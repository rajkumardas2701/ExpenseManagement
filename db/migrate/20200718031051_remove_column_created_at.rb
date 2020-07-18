class RemoveColumnCreatedAt < ActiveRecord::Migration[6.0]
  def change
  	remove_column :groups, :createdAt
  end
end
