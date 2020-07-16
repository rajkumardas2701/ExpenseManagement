class Transaction < ApplicationRecord
	validates_presence_of :name, :amount, :createdAt
end
