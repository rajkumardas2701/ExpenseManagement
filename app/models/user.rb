class User < ApplicationRecord
	has_many :groups, dependent: :destroy
	has_many :expenses, dependent: :destroy
	
	validates_presence_of :username
end
