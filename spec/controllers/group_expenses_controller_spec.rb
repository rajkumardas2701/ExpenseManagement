require 'rails_helper'

RSpec.describe GroupExpensesController, type: :controller do
  before { sign_in FactoryBot.create(:user) }
  before { @expense = FactoryBot.create(:expense) }
  before { @group = FactoryBot.create(:group) }

  describe 'Create #create' do
    context 'with valid params' do
      it 'redirects to the current group page' do
        post :create, params: { Expense_id: @expense.id, Group_id: @group.id }
        expect(response).to redirect_to(@group)
      end
    end
  end
end
