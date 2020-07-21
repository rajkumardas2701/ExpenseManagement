class Expense < ApplicationRecord
	belongs_to :user, optional: true
	has_many :group_expenses, dependent: :destroy
	has_many :groups, through: :group_expenses, dependent: :destroy
	
	validates_presence_of :name, :amount, :createdAt

	scope :total_expenses, -> (expenses) { expenses.pluck(:amount).sum }
	scope :by_recent_created, -> { order("createdAt desc") }
	scope :by_user, -> (user) { where(User_id: user.id) }
	scope :external, -> (ids) { where.not(id: GroupExpense.where(Expense_id: ids).pluck(:Expense_id)) }


# scope :get_pic, -> (expenses) { expenses.pluck(:icon) }

	# def self.get_pic(expenses)
	# 	pic = []
	# 	expenses.each do |expense|
	# 		if !expense.groups.nil?
	# 			byebug
	# 			pics += expense.groups.pluck(:icon)
	# 		end
	# 	end
	# 	pics
	# end

	def get_expense_pic(expense)
		
	end
end
