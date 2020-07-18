class ExpensesController < ApplicationController
	before_action :set_expense_item, only: [:edit, :update, :destroy, :show]

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

	def edit
	end

	def update
    respond_to do |format|
      if @expenses.update(expense_params)
        format.html { redirect_to expenses_path, notice: 'Expense was successfully updated.' }        
      else
        format.html { render :edit }        
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

	def set_expense_item
		@expenses = Expense.find(params[:id])
	end
end
