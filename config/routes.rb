Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
	root to: 'users#index'
resources :expenses
resources :groups
resources :group_expenses, only: [:create, :destroy]

get 'extExpenses', to: 'expenses#externalExpense'

end
