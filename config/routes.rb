Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
	root to: 'users#index'

get 'expenses', to: 'expenses#index'
get 'groups', to: 'groups#index'

end
