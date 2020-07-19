class GroupsController < ApplicationController
	def index
		@groups = current_user.groups.by_alpha_order
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		@group.user_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
      else
        format.html { render :new }
      end
  	end
	end


	private 

	def group_params
		params.require(:group).permit(:name, :icon)
	end

end
