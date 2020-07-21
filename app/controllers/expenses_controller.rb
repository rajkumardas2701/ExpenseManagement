class ExpensesController < ApplicationController
  before_action :set_expense_item, only: %i[edit update destroy show]
  layout 'group'

  def new
    @expenses = Expense.new
  end

  def index
    @expenses = current_user.expenses.by_recent_created.page(params[:page]).per(3)
    @sum = Expense.total_expenses(@expenses)
    # @groupPics = Expense.get_pic(@expenses)
  end

  def external_expense
    @expenses = Expense.external(ids).by_user(current_user).by_recent_created.page(params[:page]).per(3)
    @sum = Expense.total_expenses(@expenses)
  end

  def create
    @expenses = Expense.new(expense_params)
    @expenses.User_id = current_user.id
    respond_to do |format|
      if @expenses.save
        format.html { redirect_to expenses_path, notice: 'Expense was successfully added.' }
      else
        format.html { render :new }
      end
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
                                    :createdAt,
                                    :User_id)
  end

  def set_expense_item
    # @expenses = Expense.find(params[:id], condition: {User_id: current_user.id})
    #   rescue_from ActiveRecord::RecordNotFound, with => :record_not_found

    #   def record_not_found
    #     render 'record not found'
    #   end

    # if @expenses.nil?
    #   format.html { redirect_to expenses_path, notice: "You can't edit someone else's Expense" }
    # else
    @expenses = Expense.find(params[:id])
    # end
  end

  # def set_groups
  #   @groups = current_user.groups
  # end

  def ids
    ids = current_user.expenses.pluck(:id)
  end
end
