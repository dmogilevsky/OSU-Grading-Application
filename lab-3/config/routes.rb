Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Admin
  get 'admin', to: 'pages#admin'
  get 'users/:id/edit' => 'users#approve_user', as: 'approve_user'
  
  # Grader
  get 'grader', to: 'pages#grader'
  get 'graders/add', to: 'graders#add_graders', as: 'add_grader'
  get 'graders/:id/edit', to: 'graders#edit', as: 'edit_grader'
  patch 'graders/:id', to: 'graders#update', as: 'update_grader'
  put 'graders/:id', to: 'graders#update'
  get '/graders/:id/delete' => 'graders#delete_grader', as: 'delete_grader'

  # Courses
  get 'courses/add', to: 'courses#add_courses', as: 'add_course'
  get 'courses/:id/edit', to: 'courses#edit', as: 'edit_course'
  patch 'courses/:id', to: 'courses#update', as: 'update_course' # update (as needed)
  put 'courses/:id', to: 'courses#update' # update (full replacement)
  get '/courses/:id/delete' => 'courses#delete_course', as: 'delete_course'

  # Sections
  get 'sections/add', to: 'sections#add_sections', as: 'add_section'
  get 'sections/:id/edit', to: 'sections#edit', as: 'edit_section'
  patch 'sections/:id', to: 'sections#update', as: 'update_section'
  put 'sections/:id', to: 'sections#update'
  get '/sections/:id/delete' => 'sections#delete_section', as: 'delete_section'

  # Recommendations
  get 'recommendations/:id', to: 'recommendations#write_recommendations', as: 'write_recommendation'

  # db
  get 'courses/db_refresh', to: 'courses#refresh_db', as: 'reload_db'

  # Resources
  resources :users
  resources :courses
  resources :sections
  resources :recommendations
end

