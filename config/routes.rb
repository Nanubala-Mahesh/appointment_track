Rails.application.routes.draw do
  # devise_for :users
  # devise_for :users
  resources :appointments
  resources :doctors
  resources :patients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users

  # # API Purpose
  # namespace :api do
  # 	namespace :v1, defaults: {format: :json} do
		# resources :appointments
		# resources :doctors
		# resources :patients
  # 	end
  # end
end
