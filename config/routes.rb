Rails.application.routes.draw do

	root 'homes#about'

	devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions'
	}
	resources :user_communities, only: [:new, :create, :update, :index]
	resources :communities
	resources :community_posts
  resources :post_comment, only: [:edet, :update, :show, :delete]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
