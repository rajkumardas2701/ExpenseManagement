class GroupExpensesController < ApplicationController
	before_action :set_group_item
	before_action :set_expense_item

	def create
		GroupExpense.create(Expense_id: @expense.id, Group_id: @group.id)
		format.html { redirect_to @group, notice: "Expense #{@expense.name} was successfully added to #{@group.name}"}
	end

	def destroy
		group_expense = GroupExpense.where(Expense_id: @expense.id, Group_id: @group.id).first
		group_expense.destroy
		format.html { redirect_to @group, alert: "Expense #{@expense.name} was successfully removed from #{@group.name}"}
	end

	private

	def set_group_item
		@group = Expense.find(params[:group])
	end

	def set_expense_item
		@expense = Expense.find(params[:expense])
	end
end
