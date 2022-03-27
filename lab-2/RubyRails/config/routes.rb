Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get 'admin_page', to: 'pages#home'
  #get 'student_page', to: 'pages#home'
  get 'admin', to: 'pages#admin'
  get 'users/:id/edit' => 'users#approve_user', as: 'approve_user'
  get 'courses/:id/edit' => 'courses#edit_course', as: 'edit_course'
  get 'courses/add' => 'courses#add_course', as: 'add_course'
  get '/courses/:id/delete' => 'courses#delete_course', as: 'delete_course'
  resources :users
  resources :courses
  resources :admin_courses
end

