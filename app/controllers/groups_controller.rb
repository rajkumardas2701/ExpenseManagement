class GroupsController < ApplicationController
	def index
		@groups = current_user.groups.by_recent_created
	end
end
