class Expense < ApplicationRecord
  belongs_to :user, optional: true
  has_many :group_expenses, dependent: :destroy
  has_many :groups, through: :group_expenses, dependent: :destroy

  validates_presence_of :name, :amount, :createdAt

  scope :total_expenses, ->(expenses) { expenses.pluck(:amount).sum }
  scope :by_recent_created, -> { order('created_at desc') }
  scope :by_user, ->(user) { where(user_id: user.id) }
  scope :external, ->(ids) { where.not(id: GroupExpense.where(expense_id: ids).pluck(:expense_id)) }
end
