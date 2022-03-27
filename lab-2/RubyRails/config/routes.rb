Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get 'admin_page', to: 'pages#home'
  #get 'student_page', to: 'pages#home'
  get 'admin', to: 'pages#admin'
  get 'users/:id/edit' => 'users#approve_user', as: 'approve_user'

  # Courses
  get 'courses/add', to: 'courses#add_courses', as: 'add_course'
  get 'courses/:id/edit', to: 'courses#edit', as: 'edit_course'
  patch 'courses/:id', to: 'courses#update' # update (as needed)
  put 'courses/:id', to: 'courses#update' # update (full replacement)
  get '/courses/:id/delete' => 'courses#delete_course', as: 'delete_course'

  # Sections
  get 'sections/add', to: 'sections#add_sections', as: 'add_section'
  get 'sections/:id/edit', to: 'sections#edit', as: 'edit_section'
  patch 'sections/:id', to: 'sections#update' # update (as needed)
  put 'sections/:id', to: 'sections#update' # update (full replacement)
  get '/sections/:id/delete' => 'section#delete_section', as: 'delete_section'

  # Resources
  resources :users
  resources :courses
  resources :sections
  resources :admin_courses
end

