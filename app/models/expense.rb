class Expense < ApplicationRecord
  belongs_to :user, optional: true
  has_many :group_expenses, dependent: :destroy
  has_many :groups, through: :group_expenses, dependent: :destroy

  validates_presence_of :name, :amount, :createdAt

  scope :total_expenses, ->(expenses) { expenses.pluck(:amount).sum }
  scope :by_recent_created, -> { order('createdAt desc') }
  scope :by_user, ->(user) { where(User_id: user.id) }
  scope :external, ->(ids) { where.not(id: GroupExpense.where(Expense_id: ids).pluck(:Expense_id)) }
end
