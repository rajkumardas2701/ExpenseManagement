class Group < ApplicationRecord
	validates_presence_of :name, :icon, :createdAt
end
