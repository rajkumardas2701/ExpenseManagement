class Group < ApplicationRecord
	belongs_to :user
	has_many :group_expenses, dependent: :destroy
	has_many :expenses, through: :group_expenses
	
	validates_presence_of :name, :icon

	scope :by_recent_created, -> { order("created_at desc") }
end
