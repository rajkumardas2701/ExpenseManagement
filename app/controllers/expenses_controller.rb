class ExpensesController < ApplicationController
  before_action :set_expense_item, only: %i[edit update destroy show]
  before_action :set_group_item, only: %i[new edit]
  layout 'group'

  def new
    @expenses = Expense.new
  end

  def index
    @expenses = current_user.expenses.by_recent_created.page(params[:page]).per(3)
    @sum = Expense.total_expenses(current_user.expenses)
  end

  def external_expense
    @expenses = Expense.external(current_user).by_user(current_user).by_recent_created.page(params[:page]).per(3)
    @sum = Expense.total_expenses(Expense.external(current_user).by_user(current_user))
  end

  def create
    if expense_params[:group_ids].nil?
      @expense = current_user.expenses.build(expense_params)
      @expense.user_id = current_user.id
      respond_to do |format|
        if @expense.save
          format.html { redirect_to expenses_path, notice: 'Expense was successfully added.' }
        else
          format.html { render :new }
        end
      end
    elsif !expense_params[:group_ids].nil?
      @expense = current_user.expenses.build(expense_params.except(:group_ids))
      @expense.user_id = current_user.id
      respond_to do |format|
        if @expense.save
          format.html { redirect_to expenses_path, notice: 'Expense was successfully added.' }
        else
          format.html { render :new }
        end
      end
      @groups = Group.where(expense_params[:group_ids])
      ex = Expense.new
      ex.add_expense_to_group(@groups, @expense)
    end
  end

  def edit; end

  def show
    @expense = Expense.find(params[:id])
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

  def destroy
    @expenses.destroy

    respond_to do |format|
      format.html { redirect_to expenses_path, notice: 'Expense was Removed' }
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name,
                                    :amount,
                                    :user_id,
                                    group_ids: []
                                    )
  end

  def set_expense_item
    @expenses = Expense.find(params[:id])
  end

  def set_group_item
    @groups = current_user.groups
  end
end
