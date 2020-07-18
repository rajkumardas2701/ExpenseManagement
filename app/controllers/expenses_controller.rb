class ExpensesController < ApplicationController

	def new
		@expenses = Expense.new
	end	

	def index
		@expenses = current_user.expenses
	end

	def create
		@expenses = Expense.new(expense_params)
		@expenses.User_id = current_user.id
		respond_to do |format|
			if @expenses.save
				format.html { redirect_to expenses_path, notice: "Expense was successfully added."}
			else
				format.html { render :new }
			end
		end
	end

	private

	def expense_params
		params.require(:expense).permit(:name,
																		:amount,
																		:createdAt,
																		:User_id
																		)
	end
end
