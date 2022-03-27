Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get 'admin_page', to: 'pages#home'
  #get 'student_page', to: 'pages#home'
  get 'admin', to: 'pages#admin'
  get 'users/:id/edit' => 'users#approve_user', as: 'approve_user'
  get 'courses/add', to: 'courses#add_courses', as: 'add_course'
  get 'courses/:id/edit', to: 'courses#edit', as: 'edit_course'
  patch 'courses/:id', to: 'courses#update' # update (as needed)
  put 'courses/:id', to: 'courses#update' # update (full replacement)
  get '/courses/:id/delete' => 'courses#delete_course', as: 'delete_course'
  resources :users
  resources :courses
  resources :admin_courses
end

