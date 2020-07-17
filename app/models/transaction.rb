class Transaction < ApplicationRecord
	belongs_to :user
	# belongs_to :author, class_name: 'User'
	
	validates_presence_of :name, :amount, :createdAt
end
