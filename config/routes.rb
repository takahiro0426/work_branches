Rails.application.routes.draw do

	root 'homes#about'

	devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions'
	}

	resources :user_communities
	resources :communities
	resources :community_posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
