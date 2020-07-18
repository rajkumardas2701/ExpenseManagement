class Expense < ApplicationRecord
	belongs_to :user, optional: true
	has_many :group_expenses, dependent: :destroy
	has_many :groups, through: :group_expenses, dependent: :destroy
	
	validates_presence_of :name, :amount, :createdAt
end
