class ExpensesController < ApplicationController

	def index
		@expenses = current_user.expenses
	end

	
	
end
