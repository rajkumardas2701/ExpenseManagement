class Expense < ApplicationRecord
	belongs_to :user, optional: true
	has_many :group_expenses, dependent: :destroy
	has_many :groups, through: :group_expenses, dependent: :destroy
	
	validates_presence_of :name, :amount, :createdAt

	scope :total_expenses, -> (expenses) { expenses.pluck(:amount).sum }
	scope :by_recent_created, -> { order("createdAt desc") }
	scope :get_pic, -> (expenses) { expenses.pluck(:icon) }

	def get_pic(expenses)
		@pic = []
		expenses.each do |expense|
			@pics << expense.groups.pluck(:icon)
		end
		@pics
	end
end
