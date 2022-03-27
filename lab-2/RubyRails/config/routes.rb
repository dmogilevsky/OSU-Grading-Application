Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get 'admin_page', to: 'pages#home'
  #get 'student_page', to: 'pages#home'
  get 'admin', to: 'pages#admin'
  get 'users/:id/edit' => 'users#approve_user', as: 'approve_user'
  resources :users
  resources :courses
end

