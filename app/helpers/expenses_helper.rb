module ExpensesHelper
  def add_remove(object, expense)
    if object == @ungrouped
      button_to 'Add to this Group', group_expenses_path(Expense_id: expense.id, Group_id: @group.id),
                method: :post,
                class: 'btn btn-success btn-block'
    elsif object == @grouped
      button_to 'Remove from this Group', group_expense_path(Expense_id: expense.id, Group_id: @group.id),
                method: :delete,
                data: { confirm: 'Are you sure?' },
                class: 'btn btn-danger btn-block'
    end
  end
end
