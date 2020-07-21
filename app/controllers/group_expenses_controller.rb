class GroupExpensesController < ApplicationController
  before_action :set_group_item
  before_action :set_expense_item

  def create
    GroupExpense.create(Expense_id: @expense.id, Group_id: @group.id)
    flash[:notice] = "#{@expense.name} was successfully added to #{@group.name}"
    redirect_to @group
  end

  def destroy
    group_expense = GroupExpense.where(Expense_id: @expense.id, Group_id: @group.id).first
    group_expense.destroy
    flash[:alert] = "#{@expense.name} was successfully removed from #{@group.name}"
    redirect_to @group
  end

  private

  def set_group_item
    @group = Group.find(params[:Group_id])
  end

  def set_expense_item
    @expense = Expense.find(params[:Expense_id])
  end
end
